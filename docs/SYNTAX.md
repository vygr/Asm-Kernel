# Syntax

## %

(% num num ...)

## *

(* num num ...)

## +

(+ num num ...)

## -

(- num num ...)

## .*

(.* real real ...)

## .+

(.+ real real ...)

## .-

(.- real real ...)

## ./

(./ real real ...)

## ./=

(./= real real ...)

## .<

(.< real real ...)

## .<=

(.<= real real ...)

## .=

(.= real real ...)

## .>

(.> real real ...)

## .>=

(.>= real real ...)

## /

(/ num num ...)

## /=

(/= num num ...)

## <

(< num num ...)

## <<

(<< num cnt)

## <=

(<= num num ...)

## =

(= num num ...)

## >

(> num num ...)

## >=

(>= num num ...)

## >>

(>> num cnt)

## >>>

(>>> num cnt)

## aand

(aand [form] ...)

## abi

(abi) -> sym

## abs

(abs num) -> num

## acond

(acond (tst body) ...)

## age

(age path)

## aif

(aif form form [form])

## align

(align num pow2) -> num

## and

(and [tst] ...) -> t|nil|tst

## apply

(apply lambda list)

## array

(array [form ...])

## ascii-char

(ascii-char num) -> char

## ascii-code

(ascii-code char) -> num

## ascii-lower

(ascii-lower num) -> num

## ascii-upper

(ascii-upper num) -> num

## awhen

(awhen form body)

## awhile

(awhile form body)

## bind

(bind (param ...) seq)

## bind-fun

(bind-fun form) -> form

## canvas-fbox

(canvas-fbox canvas x y w h)

## canvas-fill

(canvas-fill canvas argb)

## canvas-fpoly

(canvas-fpoly canvas x y mode list)

## canvas-info

(canvas-info path)

## canvas-load

(canvas-load path flags)

## canvas-next-frame

(canvas-next-frame canvas)

## canvas-plot

(canvas-plot canvas x y)

## canvas-resize

(canvas-resize canvas canvas)

## canvas-save

(canvas-save canvas path format)

## canvas-swap

(canvas-swap canvas)

## case

(case tst [(key body)] ...)

## cat

(cat seq ...)

## catch

(catch form eform)

## char

(char num [width])

## clear

(clear array ...)

## cmp

(cmp str str)

## code

(code str [width index])

## component-connect

(component-connect component id)

## compose

(compose lambda lambda) -> lambda

## cond

(cond [(tst body)] ...)

## const

(const form)

## copy

(copy form)

## cpu

(cpu) -> sym

## create-backdrop

(create-backdrop)

## create-button

(create-button)

## create-canvas

(create-canvas width height scale)

## create-flow

(create-flow)

## create-font-ctf

(create-font-ctf name pixels)

## create-grid

(create-grid)

## create-label

(create-label)

## create-progress

(create-progress)

## create-scroll

(create-scroll flags)

## create-slave

(create-slave)

## create-slider

(create-slider)

## create-vdu

(create-vdu)

## create-view

(create-view)

## create-window

(create-window flags)

## curry

(curry lambda var ...) -> lambda

## debug

(debug name form)

## debug-format

(debug-format name env)

## debug-fun

(debug-fun name list) -> list

## dec

(dec num) -> num

## def

(def env var val [var val] ...)

## def?

(def? form [env])

## defmacro

(defmacro name ([arg ...]) body)

## defmacro-bind

(defmacro-bind name ([arg ...]) body)

## defq

(defq var val [var val] ...)

## defun

(defun name ([arg ...]) body)

## defun-bind

(defun-bind name ([arg ...]) body)

## defun-debug

(defun-debug name ([arg ...]) body)

## each

(each lambda seq ...)

## each!

(each! start end lambda (seq ...))

## each-line

(each-line lambda stream)

## each-mergeable

(each-mergeable lambda seq) -> seq

## each-mergeable-rev

(each-mergeable-rev lambda seq) -> seq

## each-rev

(each-rev lambda seq ...)

## elem

(elem index seq)

## elem-set

(elem-set index list val)

## ends-with

(ends-with str str) -> t|nil

## env

(env [num])

## eql

(eql form form)

## erase

(erase seq start end) -> seq

## eval

(eval form [env])

## every

(every lambda seq ...) -> nil|form

## exec

(exec ast)

## f2r

(f2r num)

## fcos

(fcos angle)

## fdiv

(fdiv num num ...)

## ffi

(ffi sym path flags)

## file-stream

(file-stream path)

## filter

(filter lambda seq) -> list

## find

(find elem seq)

## floor

(floor num)

## fmod

(fmod num num ...)

## fmul

(fmul num num ...)

## fnc?

(fnc? form) -> bool

## font-glyph-paths

(font-glyph-paths font str)

## frac

(frac num)

## from-base-char

(from-base-char str) -> num

## fsin

(fsin angle)

## fsqrt

(fsqrt num)

## gensym

(gensym)

## get-byte

(get-byte str index) -> num

## get-cstr

(get-cstr str index) -> str

## get-field

(get-field obj field size|0)

## get-int

(get-int str index) -> num

## get-long

(get-long str index) -> num

## get-short

(get-short str index) -> num

## gui-add

(gui-add view)

## gui-add-back

(gui-add-back view)

## i2r

(i2r num)

## if

(if tst form [eform])

## import

(import path)

## in-get-state

(in-get-state in) -> num

## in-mbox

(in-mbox in) -> mbox

## in-next-msg

(in-next-msg in)

## in-set-state

(in-set-state in num) -> in

## in-stream

(in-stream)

## inc

(inc num) -> num

## insert

(insert seq pos seq) -> seq

## is-debug-fun

(is-debug-fun form)

## join

(join list seq) -> seq

## kernel-debug

(kernel-debug str)

## kernel-declare

(kernel-declare name mbox)

## kernel-total

(kernel-total)

## lambda

(lambda ([arg ...]) body)

## length

(length seq)

## let

(let ([(var val) ...]) body)

## list

(list [form ...])

## load

(load path)

## log2

(log2 num) -> num

## logand

(logand [num] ...)

## logior

(logior [num] ...)

## lognot

(lognot num) -> num

## logxor

(logxor [num] ...)

## lst?

(lst? form) -> bool

## macroexpand

(macroexpand form)

## mail-declare

(mail-declare name mbox)

## mail-enquire

(mail-enquire name)

## mail-poll

(mail-poll mboxs)

## mail-read

(mail-read mbox)

## mail-select

(mail-select mboxs)

## mail-send

(mail-send obj mbox)

## map

(map lambda seq ...) -> list

## map-rev

(map-rev lambda seq ...) -> list

## match?

(match? list list)

## max

(max num num ...)

## mem-stats

(mem-stats options)

## merge

(merge dlist slist) -> dlist

## min

(min num num ...)

## neg

(neg num) -> -num

## nlo

(nlo num) -> num

## nlz

(nlz num) -> num

## not

(not form) -> t|nil

## notany

(notany lambda seq ...) -> t|nil

## notevery

(notevery lambda seq ...) -> t|nil

## nto

(nto num) -> num

## ntz

(ntz num) -> num

## num?

(num? form) -> bool

## open-child

(open-child path mode)

## open-farm

(open-farm path num mode)

## open-pipe

(open-pipe paths)

## open-remote

(open-remote path cpu mode)

## opt

(opt var val [cond])

## or

(or [tst] ...) -> nil|tst

## out-stream

(out-stream mbox)

## pad

(pad form width [str]) -> str

## partition

(partition lambda list start end)

## penv

(penv env)

## pii-read-char

(pii-read-char fd)

## pii-write-char

(pii-write-char fd char)

## points

(points [form ...])

## points-abs

(points-abs points [points])

## points-add

(points-add points points [points])

## points-div

(points-div points points [points])

## points-fdiv

(points-fdiv points points [points])

## points-fmod

(points-fmod points points [points])

## points-fmul

(points-fmul points points [points])

## points-frac

(points-frac points [points])

## points-fscale

(points-fscale points scale [points])

## points-gen-arc

(points-gen-arc cx cy start end radius tol dst) -> dst

## points-gen-cubic

(points-gen-cubic p1x p1y p2x p2y p3x p3y p4x p4y tol dst) -> dst

## points-gen-quadratic

(points-gen-quadratic p1x p1y p2x p2y p3x p3y tol dst) -> dst

## points-mod

(points-mod points points [points])

## points-mul

(points-mul points points [points])

## points-simplify

(points-simplify dst src tol)

## points-stroke-polygons

(points-stroke-polygons radius tol join src dst) -> dst

## points-stroke-polylines

(points-stroke-polylines radius tol join cap1 cap2 src dst) -> dst

## points-sub

(points-sub points points [points])

## points-sum

(points-sum points)

## points-transform

(points-transform dst src m1x m1y m2x m2y trx try)

## pop

(pop array)

## prin

(prin [form ...])

## print

(print [form ...])

## progn

(progn [form ...])

## push

(push array form ...)

## quasi-quote

(quasi-quote form)

## quote

(quote form)

## r2f

(r2f real)

## r2i

(r2i real)

## random

(random num)

## range

(range start end [step]) -> list

## rcurry

(rcurry lambda var ...) -> lambda

## read

(read stream last_char)

## read-avail

(read-avail stream)

## read-char

(read-char stream [width])

## read-line

(read-line stream)

## reduce

(reduce lambda seq [accum]) -> form

## reduce-rev

(reduce-rev lambda seq [accum]) -> form

## repl

(repl stream path)

## save

(save str path)

## set

(set env var val [var val] ...)

## set-field

(set-field obj field size|0 val)

## setd

(setd var val [var val] ...)

## setq

(setq var val [var val] ...)

## shuffle

(shuffle list [start end]) -> list

## shuffled

(shuffled list [start end]) -> list

## sign

(sign num) -> -1|0|1

## slave-get-args

(slave-get-args slave) -> list

## slice

(slice start end seq)

## some

(some lambda seq ...) -> nil|form

## some!

(some! start end mode lambda (seq ...))

## sort

(sort list [start end]) -> list

## sorted

(sorted list [start end]) -> list

## split

(split str char)

## starts-with

(starts-with str str) -> t|nil

## str

(str [form ...])

## str?

(str? form) -> bool

## stream-avail

(stream-avail stream)

## stream-flush

(stream-flush stream)

## string-stream

(string-stream str)

## swap

(swap list index index)

## sym

(sym str)

## sym?

(sym? form) -> bool

## task-mailbox

(task-mailbox)

## task-sleep

(task-sleep usec)

## throw

(throw str form)

## time

(time)

## times

(times num body)

## to-base-char

(to-base-char num) -> str

## to-lower

(to-lower str) -> str

## to-num

(to-num str) -> num

## to-upper

(to-upper str) -> str

## trim

(trim str [str]) -> str

## trim-end

(trim-end str [str]) -> str

## trim-start

(trim-start str [str]) -> str

## type-of

(type-of obj)

## undef

(undef env var [var] ...)

## unless

(unless tst body)

## until

(until tst body)

## vdu-load

(vdu-load vdu lines ox oy cx cy)

## vdu-print

(vdu-print vdu str)

## view-add-back

(view-add-back parent child)

## view-add-child

(view-add-child parent child)

## view-add-dirty

(view-add-dirty view x y w h)

## view-add-front

(view-add-front parent child)

## view-add-opaque

(view-add-opaque view x y w h)

## view-change

(view-change view x y w h)

## view-change-dirty

(view-change-dirty view x y w h)

## view-dirty

(view-dirty view)

## view-event

(view-event view str)

## view-find-id

(view-find-id view id)

## view-get-bounds

(view-get-bounds view) -> (x y w h)

## view-get-pos

(view-get-pos view) -> (x y)

## view-get-size

(view-get-size view) -> (w h)

## view-hide

(view-hide view)

## view-layout

(view-layout view)

## view-pref-size

(view-pref-size view)

## view-set-bounds

(view-set-bounds view x y w h) -> view

## view-set-flags

(view-set-flags view flags mask)

## view-set-pos

(view-set-pos view x y) -> view

## view-set-size

(view-set-size view w h) -> view

## view-sub

(view-sub view)

## view-sub-opaque

(view-sub-opaque view x y w h)

## when

(when tst body)

## while

(while tst body)

## window-connect-close

(window-connect-close window id) -> window

## window-connect-max

(window-connect-max window id) -> window

## window-connect-min

(window-connect-min window id) -> window

## window-set-status

(window-set-status window txt) -> window

## window-set-title

(window-set-title window txt) -> window

## within-compile-env

(within-compile-env lambda)

## write

(write stream str)

## write-char

(write-char stream list|num [width])

## write-line

(write-line stream str) -> stream

