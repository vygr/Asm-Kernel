# Iteration, Predication and Sequences

This document covers the topic of iteration of sequences and the functions
available to operate on sequences of elements. There are several ChrysaLisp
built in types that inherit from `class/seq`, this class defines an interface
to extract individual elements from a sequence, discover the length, cut and
splice elements and slices of said sequences together and find the index of an
element in a sequence of those elements.

These built in interface features are used by higher level functions to expose
and extend them to Lisp level code.

## Sequences

Classes that inherit from `class/seq`:

* class/array
* class/list
* class/nums
* class/fixeds
* class/reals
* class/str
* class/sym

```lisp
(list 1 2 3 4)
(list "a" "b")
(array 5 6 7 8)
"ABCDEFabcdef"
'qwerty
```

To discover the length of a sequence, use the `(length)` function:

```lisp
(length (list 1 2 3))
3
(length "ABCDEF")
6
```

Extraction of a single element with `(elem)`. Negative indexes mean to index
from the back of the sequence ! Very useful !

```lisp
(elem 1 "abcd")
"b"
(elem -2 (array 9 8 7))
7
```

Note that negative indexes start at -1 representing the element that would be 1
off the end of the sequence, so -2 means the final elements index. There is a
good reason for this as will be illustrated with the `(slice)` function below.

Extracting a 'slice' of a sequence with `(slice)`:

```lisp
(slice 0 3 "ABCDEF")
"ABC"
(slice 1 -2 "ABCDEF")
"BCDE"
```

Splice sequences together by using `(cat)`:

```lisp
(cat (list 1 2 3) (list 5 6 7))
(1 2 3 5 6 7)
(cat "ABC" 'def "qwerty")
"ABCdefqwerty"
(cat (fixeds 1.5 6.7 8.9) (fixeds 5.6 1.23 9.01 8.9))
(1.50000 6.69999 8.89999 5.59999 1.22999 9.00999 8.89999)
(apply cat (list "a" "b" "c"))
"abc"
```

Search for an element with `(find)` and `(find-rev)`:

```lisp
(find "a" "defopqaui")
6
(find 5 (array 1 2 3 4 5))
4
(find "a" "def")
nil
(find 'a (list 'd 't 'y 'a 'j 'k 'd))
3
(find-rev 'd (list 'd 't 'y 'a 'j 'k 'd))
6
```

## Iteration

You can iterate over a sequence or slice of a sequence, forwards or backwards
by use of the `(each!)` function. You provide the function that will be called
for the group of elements from each index position. `(each)` and `(each-rev)`
are macros that assume the index values cover the full extent of the sequence
and take the sequence list as arguments rather than an explicit list.

Any elements over the minimum length of the given sequences are ignored.

The function being called is passed the current index value bound to the '_'
symbol ! Very useful !

```lisp
(each! 0 -1 print (list '(1 2 3) "ABC" (array 7 8 9 0)))
1A7
2B8
3C9
(each! 0 -1 (# (print (+ %0 %1))) (list '(1 2 3) '(7 2 4)))
8
4
7
(each print "ABCDEF" "123456")
A1
B2
C3
D4
E5
F6
(each! -2 1 print (list "ABCDEF" "123456"))
E5
D4
C3
B2
```

## Predication

You can predicate over a sequence or slice of a sequence, forwards or backwards
by use of the `(some!)` function. You provide the function that will be called
for the group of elements from each index position, you can decide if it will
exit if that function returns a `nil` or not. `(some)` `(every)` `(notany)` and
`(notevery)` are macros that assume the index values cover the full extent of
the sequence and set the break out option, plus take the sequence list as
arguments rather than an explicit list.

The break out value is returned ! This means you can use these functions as a
breakable for loop or a search loop !

As with `(each!)` the function being called is passed the current index value
bound to the '_' symbol ! Very useful !

```lisp
(some! 0 -1 t = (list '(1 2 3) '(5 6 3)))
t
(some (# (if (eql %0 "a") _)) "defhqaio")
5
(some > (array 1 2 3) (array 5 6 7))
nil
(some < (array 1 2 3) (array 5 6 7))
t
(every < (array 1 2 3) (array 5 6 7))
t
```

## Map and Reduce

Mapping and reduction transform a sequence by either transforming each element
or combining each element to a single result. Reduction can take an optional
start value.

These also come in `(map-rev)` and `(reduce-rev)` flavours.

```lisp
(map + '(1 2 3) '(6 7 8) '(1 7 6))
(8 16 17)
(map-rev + '(1 2 3) '(6 7 8) '(1 7 6))
(17 16 8)
(map (# (str %0 %1 %2)) '(1 2 3) '(6 7 8) '(1 7 6))
("161" "277" "386")
(reduce + '(1 2 3))
6
(reduce (# (push %0 %1)) "ABCD" (list))
("A" "B" "C" "D")
(reduce-rev (# (push %0 %1)) "ABCD" (list))
("D" "C" "B" "A")
```
