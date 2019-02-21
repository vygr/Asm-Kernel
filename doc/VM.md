# Virtual Machine

This document covers a variety of subjects to do with the VM that ChrysaLisp
employs. Some of them are not exactly about the VM but they are all to do with
how code gets executed, called and so forth.

## Virtual Processor

The lowest level of ChrysaLisp is the Virtual Processor (VP), this is an
imaginary RISC like processor that the assembler and script compiler target.

It is, currently, a very simple 64 bit 16 register load/store machine. It may
be extended in the future with features like floating point registers or vector
instructions, but for now I'm preferring to see just how far you can push such
a simple integer design.

It supports a very orthogonal logic and arithmetic instruction set and a few
simple load/store addressing modes.

### Registers

```
r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, rsp
```

These are mapped to real physical registers by the target processor 'emit'
functions, look in `sys/x64.inc` and `sys/arm.inc`. On certain processors, like
the x86_64, it's worth knowing that r0 and r2 are mapped to rax and rdx when it
comes to scheduling VP div and rem code ! It makes no difference to the aarch64
emit functions, so one does tend to make VP divide code use r0 and r2 as it
really helps the x86_64 code generation quality.

You can use the `(vp-def)` macro to assign register equated symbols to help
your source look nice. Or bind symbols to registers, via `(method-input)` and
`(method-output)`, that match function entry/exit parameters if you desire. A
great example of this is the `canvas::fpoly`, or the `canvas::resize_2`
functions.

### VP Assembler

#### Constant to register

```
(vp-cpy-cr c rd)
(vp-add-cr c rd)
(vp-sub-cr c rd)
(vp-mul-cr c rd)

(vp-and-cr c rd)
(vp-or-cr c rd)
(vp-xor-cr c rd)

(vp-shl-cr c rd)
(vp-shr-cr c rd)
(vp-asr-cr c rd)
```

#### Register to register

```
(vp-cpy-rr rs rd)
(vp-add-rr rs rd)
(vp-sub-rr rs rd)
(vp-mul-rr rs rd)

(vp-and-rr rs rd)
(vp-or-rr rs rd)
(vp-xor-rr rs rd)

(vp-shl-rr rs rd)
(vp-shr-rr rs rd)
(vp-asr-rr rs rd)

(vp-div-rrr rs rdh rdl)
(vp-div-rrr-u rs rdh rdl)
```

#### Logical And, Not

```
(vp-lnot-rr rt rd)
(vp-land-rr rs rd)
```

#### Register to Memory

```
(vp-cpy-rp rs label)
(vp-cpy-ri rs rb i)
(vp-cpy-rd rs rb ri)
(vp-cpy-ri-b rs rb i)
(vp-cpy-rd-b rs rb ri)
(vp-cpy-ri-s rs rb i)
(vp-cpy-rd-s rs rb ri)
(vp-cpy-ri-i rs rb i)
(vp-cpy-rd-i rs rb ri)
```

#### Memory to Register

```
(vp-cpy-pr label rd)
(vp-cpy-ir rb i rd)
(vp-cpy-dr rb ri rd)
(vp-cpy-ir-b rb i rd)
(vp-cpy-dr-b rb ri rd)
(vp-cpy-ir-ub rb i rd)
(vp-cpy-dr-ub rb ri rd)
(vp-cpy-ir-s rb i rd)
(vp-cpy-dr-s rb ri rd)
(vp-cpy-ir-us rb i rd)
(vp-cpy-dr-us rb ri rd)
(vp-cpy-ir-i rb i rd)
(vp-cpy-dr-i rb ri rd)
(vp-cpy-ir-ui rb i rd)
(vp-cpy-dr-ui rb ri rd)
```

#### Branch

```
(vp-beq-cr c rd label)
(vp-bne-cr c rd label)
(vp-blt-cr c rd label)
(vp-ble-cr c rd label)
(vp-bgt-cr c rd label)
(vp-bge-cr c rd label)

(vp-beq-rr rs rd label)
(vp-bne-rr rs rd label)
(vp-blt-rr rs rd label)
(vp-ble-rr rs rd label)
(vp-bgt-rr rs rd label)
(vp-bge-rr rs rd label)
```

#### Effective address

```
(vp-lea-i rb i rd)
(vp-lea-d rb ri rd)
(vp-lea-p label rd)
```

#### Call, Jump, Ret

```
(vp-call label)
(vp-call-r rd)
(vp-call-i rb i)
(vp-call-p label)
(vp-call-abi rt rb i arg-list)

(vp-jmp label)
(vp-jmp-r rd)
(vp-jmp-i rb i)
(vp-jmp-p label)

(vp-ret)
```

#### Push, Pop

```
(vp-push rx ry ...)
(vp-pop rx ry ...)

(vp-alloc c)
(vp-free c)
```

#### Swap, Extend

```
(vp-swp-rr rs rd)
(vp-ext-rr rs rd)
```

#### Pseudo ops

```
(vp-label label)
(vp-align align [byte])
(vp-string string)
(vp-byte byte ...)
(vp-short short ...)
(vp-int int ...)
(vp-long long ...)
```

## Calling Convention

Simple answer is there is none. The better answer is that all calls, apart from
host OS ABI calls, take parameters in registers and not via the stack ! All
functions define their register inputs and outputs, and document register
trashes if they can. The `(assign)` function will do any parameter mapping and
copying for you, it will tell you if it can't due to a circular mapping so you
can add a temp. Assignment will not attempt to spill to the stack or assign
temp registers !

In other systems, OS and Compilers, they adopt some convention for parameter
register layout and stack layout, but suffer performance problems and inability
to support features, like function chaining, as a result. You will often see a
ChrysaLisp function jump out to another function in order to save on stack
space with the eventual return going back to the original caller. Prime example
are deinit methods that chain on to their parent deinit with a direct
`(s-jump)`, but this happens all over the code base where possible.

The `(dec-method)` function takes the lists of input and output parameter
registers. If the list of inputs or outputs is `nil` this means to inherit the
list from the parent class declaration.

An example from the array class.inc.

```
(dec-method 'find 'class/array/find 'static '(r0 r1) '(r0 r1))
(dec-method 'for_each 'class/array/for_each 'static '(r0 r1 r2 r3 r4) '(r0 r1))
(dec-method 'sort 'class/array/sort 'static '(r0 r1 r2 r3 r4 r5) '(r0))
(dec-method 'partition 'class/array/partition 'static '(r0 r1 r2 r3 r4) '(r0 r1))
```

Core functions in the kernel and class libs are very careful to track and
document their register trashing. Higher level functions often use the next
registers available while calling lower functions in order to avoid stack
push/pop or other memory read/write instructions.

Any use of the script expression compiler means all bets are off as regards
register trashing, so you will see that all such functions are documented as
'trashes all'. However the expression compiler can be constrained to use only a
specific set of registers to do it's work, but that's an advanced topic for
specialist code generation, the vector math DSL takes full advantage of this
feature.

## VP function example

This is the system level string compare function. `sys_string::compare`

Register inputs and outputs are declared in the `sys/string/class.inc` file.

```
(def-class 'sys_string)
(dec-method 'compare 'sys/string/compare 'static '(r0 r1) '(r0))
```

So this function will take the C style input char*'s in registers r0 and r1,
and will return the comparison value in register r0.

Implementation of the function is defined in the `sys/string/class.vp` file.

```
(def-method 'sys_string 'compare)
	;inputs
	;r0 = c string1 (pubyte)
	;r1 = c string2 (pubyte)
	;outputs
	;r0 = 0 if same, else -, +
	;trashes
	;r0-r3

	(entry 'sys_string 'compare '(r0 r1))
	(loop-start)
		(vp-cpy-ir-ub r0 0 r2)
		(vp-cpy-ir-ub r1 0 r3)
		(vp-sub-rr r3 r2)
		(breakif '(r2 != 0))
		(breakif '(r3 == 0))
		(vp-add-cr byte_size r0)
		(vp-add-cr byte_size r1)
	(loop-end)
	(exit 'sys_string 'compare '(r2))
	(vp-ret)

(def-func-end)
```

So let's go through the important lines in this function.

First of all the `(def-method 'sys_string 'compare)` is doing the same job as a
`(def-func)` would do, it's a wrapper function to simplify writing the
`(def-func)` that also does some extra checks to make sure you actually do have
a `(dec-method)` for it in the include file. The `(def-func-end)` just wraps
the function, matching any `(def-func)` or `(def-method)`. If you want to dive
into what these calls do to get your function compiled and written out, look in
`sys/func.inc` where all the magic happens.

Next there is a section of documentation, this format can be parsed out by the
`make doc` command line tool. Parsed documentation ends up in the
`doc/CLASSES.md` file.

The `(entry 'sys_string 'compare '(r0 r1))` and `(exit 'sys_string 'compare
'(r2))` calls are helpers to make sure input and output parameters get copied
to the correct registers. They enforce the `(def-method)` input and output
register declarations by use of two `(assign)` calls. The register lists
provided here are auto assigned from and to the declared register input and
output lists ! In this case the entry of `'(r0 r1)` turns into an `(assign '(r0
r1) '(r0 r1))` which ends up emitting no code, but the exit of `'(r2)` does an
`(assign '(r2) '(r0))` which emits a `(vp-cpy-rr r2 r0)` ensuring that the
result in r2 ends up copied to the declared output r0. So entry and exit
helpers ensure your function sticks to its declared contract with the outside
world.

The other lines that are not basic VP code instructions are `(loop-start)`,
`(loop-end)` and `(breakif)` functions. These are structured coding functions
defined within the `sys/code.inc` file. There are many such helper functions
that allow all the basic structured code concepts to be used, even within VP
code as well as C-Script level code. These will be covered in detail in other
documents, but here the use is fairly obvious.
