# Lisp

It's probably worth a few words specifically about the included Lisp and how it
works, and how many rules it breaks ! The reason for doing the Lisp was to
allow me to create an assembler to replace NASM, I was not concerned with
sticking to 'the lisp way', or whatever your local Lisp guru says. No doubt I
will have many demons in hell awaiting me...

First of all there is no garbage collector by choice. All objects used by the
Lisp are reference counted objects from the class library. Early on the Lisp
was never going to have a problem with cycles because it had no way to create
them, but as I developed the assembler I decided to introduce two functions,
`(push)` and `(elem-set)`, that could create cycles. However the efficiency
advantage in coding the assembler made me look the other way. There are now
other ways that a cycle can be created, by naming an environment within its own
scope, but again this was too good an efficiency feature to miss out on. So you
do have to be careful not to create cycles, so think about how your code works.

No tail recursion optimization ! There is a single looping function provided in
native code, `(while)`, every other looping construct builds on this primitive.
There are also two native primitives `(some!)` and `(each!)` that provide
generic access to iterating over a slice of a sequence/s, while calling a
function on the grouped elements. Standard `(some)` and `(each)` are built on
these but they also allow other constructs to be built and gain the advantage
of machine coded iteration. I try to stick to a functional approach in my Lisp
code, and manipulate collections of things in a functional way with operations
like `(map)`, `(filter)`, `(reduce)`, `(each)` etc. I've not found the lack of
tail recursion a problem.

There is no `(return)` statement !!! Functions run till they naturally exit,
there is no option to break out in the middle of a loop and `(return)`... I
view this as promoting a clean functional design, but you might like to
disagree ;)

All symbols live in the same environment, functions, macros, everything. The
environment is a chain of hash maps. Each lambda gets a new hash map pushed
onto the environment chain on invocation, and dereferenced on exit. The `(env)`
function can be used to return the current hash map and optionally resize the
number of buckets from the default of 1. This proves very effective for storing
large numbers of symbols and objects for the assembler as well as creating
caches. Make sure to `(setq)` the symbol you bind to the result of `(env)` to
`nil` before returning from the function if you do this, else you will create a
cycle that can't be freed.

`(defq)` and `(bind)` always create entries in the current environment hash
map. `(setq)` searches the environment chain to find an existing entry and sets
that entry or fails with an error. This means `(setq)` can be used to write to
symbols outside the scope of the current function. Some people don't like this,
but used wisely it can be very powerful. Coming from an assembler background I
prefer to have all the guns and knives available, so try not to shoot your foot
off.

There is no cons, cdr or car stuff. Lists are just vector objects and you use
`(push)`, `(cat)`, `(slice)` etc to manipulate elements. Also an empty list
does not evaluate to `nil`, it's just an error.

Function and macro definitions are scoped and visible only within the scope of
the declaring function. There is no global macro list. During macro expansion
the environment chain is searched to see if a macro exists.

## Within any Lisp instance

### Built in symbols

```lisp
&rest
&optional
nil
t
```

### Built in functions

```lisp
% * + - / /= < << <= = > >= >> >>> abs age apply array bind cap cat catch char
clear cmp code cond copy def defq each! elem elem-set env eql eval f2i f2r ffi
file-stream find find-rev fixeds gensym get hash i2f i2r io-stream lambda
length list load logand logior logxor macro macroexpand match? max merge-obj
min neg nums partition penv pop prebind prin print progn push quasi-quote quote
r2f r2i random read read-avail read-char read-line reals repl save set setq
slice some! split str string-stream sym throw time tolist type-of undef while
write write-char
```

### boot.inc symbols

```lisp
+min_long+
+max_long+
+min_int+
+max_int+
+fp_shift+
+fp_2pi+
+fp_pi+
+fp_hpi+
+fp_rpi+
+fp_int_mask+
+fp_frac_mask+
*debug_mode*
*debug_emit*
*debug_inst*
```

### boot.inc macros

```lisp
# and ascii-char ascii-code case compose const curry dec defmacro defmacro-bind
defun defun-bind each each-rev env? every fnc? fun? get-byte get-int get-long
get-short get-ubyte get-uint get-ushort if inc let lst? macro? not notany
notevery num? opt or rcurry read-int read-long read-short reduced seq? setd
some str? sym? times unless until when write-int write-long write-short
```

### boot.inc functions

```lisp
abi align ascii-lower ascii-upper char-to-num cpu each-line each-mergeable
each-mergeable-rev empty? ends-with erase even? exec filter first get-cstr
import insert intern intern-seq join last load-stream log2 lognot map map-rev
neg? nempty? nil? nlo nlz nto ntz num-to-char num-to-utf8 odd? pad pos? pow
range reduce reduce-rev reduced-reduce reduced-reduce-rev rest reverse second
shuffle shuffled sort sorted starts-with str-to-num swap to-lower to-upper trim
trim-end trim-start type-to-size unzip within-compile-env write-line zip
```

## Within any cmd/lisp.lisp instance

### asm.inc functions

```lisp
all-vp-files
compile
compile-pipe
compile-test
make
make-all
make-all-platforms
make-boot
make-boot-all
make-info
make-platforms
make-test
remake
remake-platforms
```

## Within a `*compile_env*` enviroment

### `*compile_env*` symbols

```lisp
*compile_env*
*compile_includes*
```

### `*compile_env*` macros

```lisp
defcvar
undefc
```

### `*compile_env*` functions

```lisp
include
```
