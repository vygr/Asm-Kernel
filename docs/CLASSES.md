# Classes

## array

Super Class: seq

### array::vtable -> class/array/vtable

### array::create -> class/array/create

### array::init -> class/array/init

```lisp
inputs
r0 = array object (ptr)
r1 = vtable (pptr)
outputs
r0 = array object (ptr)
r1 = 0 if error, else ok
trashes
r1-r2
```

### array::get_capacity -> class/array/get_capacity

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = capacity (uint)
trashes
r1
```

### array::set_capacity -> class/array/set_capacity

```lisp
inputs
r0 = array object (ptr)
r1 = capacity (uint)
outputs
r0 = array object (ptr)
trashes
r1-r5
```

### array::set_length -> class/array/set_length

```lisp
inputs
r0 = array object (ptr)
r1 = length (uint)
outputs
r0 = array object (ptr)
r1 = length (uint)
trashes
none
```

### array::sort -> class/array/sort

```lisp
inputs
r0 = array object (ptr)
r1 = stack array object (ptr)
r2 = lower iter (plong)
r3 = upper iter (plong)
r4 = compare callback (ptr)
r5 = sort context (ptr)
outputs
r0 = array object (ptr)
trashes
r1-r14
sort callback
inputs
r0 = context (ptr)
r1 = iter1 (plong)
r2 = iter2 (plong)
outputs
r0 = +, 0, -
trashes
r1-r14
```

### array::partition -> class/array/partition

```lisp
inputs
r0 = array object (ptr)
r1 = lower partition iter (plong)
r2 = upper partition iter (plong)
r3 = sort callback (ptr)
r4 = sort context (ptr)
outputs
r0 = array object (ptr)
r1 = partition iter (plong)
trashes
r1-r14
sort callback
inputs
r0 = sort context (ptr)
r1 = iter1 (plong)
r2 = iter2 (plong)
outputs
r0 = +, 0, -
trashes
r1-r14
```

### array::get_first -> class/array/get_first

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = element (long)
trashes
r1
```

### array::get_first2 -> class/array/get_first2

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = element1 (long)
r2 = element2 (long)
trashes
r1-r2
```

### array::get_second -> class/array/get_second

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = element (long)
trashes
r1
```

### array::get_element -> class/array/get_element

```lisp
inputs
r0 = array object (ptr)
r1 = element index (uint)
outputs
r0 = array object (ptr)
r1 = element (long)
trashes
r1-r2
```

### array::get_element2 -> class/array/get_element2

```lisp
inputs
r0 = array object (ptr)
r1 = element index (uint)
outputs
r0 = array object (ptr)
r1 = element1 (long)
r2 = element2 (long)
trashes
r1-r2
```

### array::push_back -> class/array/push_back

```lisp
inputs
r0 = array object (ptr)
r1 = element (long)
outputs
r0 = array object (ptr)
r1 = element (long)
r2 = begin element iter (plong)
r3 = end element iter (plong)
trashes
r2-r5
```

### array::push_back2 -> class/array/push_back2

```lisp
inputs
r0 = array object (ptr)
r1 = element1 (long)
r2 = element2 (long)
outputs
r0 = array object (ptr)
r1 = element1 (long)
r2 = element2 (long)
r3 = begin element iter (plong)
r4 = end element iter (plong)
trashes
r3-r5
```

### array::pop_back -> class/array/pop_back

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = element (long)
trashes
r1-r2
```

### array::pop_back2 -> class/array/pop_back2

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = element1 (long)
r2 = element2 (long)
trashes
r1-r2
```

### array::get_iter -> class/array/get_iter

```lisp
inputs
r0 = array object (ptr)
r1 = element index (uint)
outputs
r0 = array object (ptr)
r1 = element iter (plong)
trashes
r1-r2
```

### array::get_iters -> class/array/get_iters

```lisp
inputs
r0 = array object (ptr)
r1 = begin index (uint)
r2 = end index (uint)
outputs
r0 = array object (ptr)
r1 = begin element iter (plong)
r2 = end element iter (plong)
trashes
r1-r3
```

### array::get_begin -> class/array/get_begin

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = begin element iter (plong)
trashes
r1
```

### array::get_end -> class/array/get_end

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = end element iter (plong)
trashes
r1-r2
```

### array::get_both -> class/array/get_both

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = begin element iter (plong)
r2 = end element iter (plong)
trashes
r1-r2
```

### array::sort_callback -> class/obj/null

### array::print -> class/array/print

```lisp
inputs
r0 = array object (ptr)
r1 = stream object (ptr)
outputs
r0 = array object (ptr)
trashes
r1-r14
```

### array::vcreate -> class/array/create

### array::velement -> class/num/create

### array::clear -> class/array/clear

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
trashes
r1
```

### array::ref_back -> class/array/ref_back

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = num object (ptr)
trashes
r1-r3
```

### array::set_element -> class/array/set_element

```lisp
inputs
r0 = array object (ptr)
r1 = element object (ptr)
r2 = element index (uint)
outputs
r0 = array object (ptr)
trashes
r2-r3
```

### array::append -> class/array/append

```lisp
inputs
r0 = array object (ptr)
r1 = source array object (ptr)
r2 = element start index (uint)
r3 = element end index (uint)
outputs
r0 = array object (ptr)
trashes
r1-r9
```

### array::deinit -> class/array/deinit

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
trashes
r1-r14
```

### array::ref_element -> class/array/ref_element

```lisp
inputs
r0 = array object (ptr)
r1 = element index (uint)
outputs
r0 = array object (ptr)
r1 = num object (ptr)
trashes
r1-r3
```

### array::slice -> class/array/slice

```lisp
inputs
r0 = array object (ptr)
r1 = element start index (uint)
r2 = element end index (uint)
outputs
r0 = array object (ptr)
r1 = slice array object (ptr)
trashes
r1-r8
```

### array::cat -> class/array/cat

```lisp
inputs
r0 = array object (ptr)
r1 = list of array objects (ptr)
outputs
r0 = 0 if error, else new array object (ptr)
trashes
r0-r11
```

### array::get_length -> class/array/get_length

```lisp
inputs
r0 = array object (ptr)
outputs
r0 = array object (ptr)
r1 = array length (uint)
trashes
r1
```

### array::find -> class/array/find

```lisp
inputs
r0 = array object (ptr)
r1 = element (long)
outputs
r0 = array object (ptr)
r1 = element (long)
r2 = -1, else index (int)
trashes
r2-r4
```

### array::rfind -> class/array/rfind

```lisp
inputs
r0 = array object (ptr)
r1 = element (long)
outputs
r0 = array object (ptr)
r1 = element (long)
r2 = -1, else index (int)
trashes
r2-r4
```

### array::lisp_array -> class/array/lisp_array

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### array::lisp_nums -> class/array/lisp_nums

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### array::lisp_fixeds -> class/array/lisp_fixeds

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### array::lisp_reals -> class/array/lisp_reals

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### array::lisp_path -> class/array/lisp_path

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### array::lisp_clear -> class/array/lisp_clear

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### array::lisp_push -> class/array/lisp_push

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### array::lisp_pop -> class/array/lisp_pop

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### array::lisp_cap -> class/array/lisp_cap

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## backdrop

Super Class: view

### backdrop::vtable -> gui/backdrop/vtable

### backdrop::create -> gui/backdrop/create

### backdrop::pref_size -> gui/backdrop/pref_size

```lisp
inputs
r0 = backdrop object (ptr)
outputs
r0 = backdrop object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r9-r10
```

### backdrop::draw -> gui/backdrop/draw

```lisp
inputs
r0 = view object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### backdrop::layout -> gui/backdrop/layout

```lisp
inputs
r0 = backdrop object (ptr)
outputs
r0 = backdrop object (ptr)
trashes
r1-r14
```

### backdrop::lisp_create -> gui/backdrop/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## button

Super Class: label

### button::vtable -> gui/button/vtable

### button::create -> gui/button/create

### button::init -> gui/button/init

```lisp
inputs
r0 = button object (ptr)
r1 = vtable (pptr)
outputs
r0 = button object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### button::draw -> gui/button/draw

```lisp
inputs
r0 = button object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = button object (ptr)
trashes
r1-r14
```

### button::layout -> gui/button/layout

```lisp
inputs
r0 = button object (ptr)
outputs
r0 = button object (ptr)
trashes
r1-r14
```

### button::mouse_down -> gui/button/mouse_move

```lisp
inputs
r0 = button object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = button object (ptr)
trashes
r1-r14
```

### button::mouse_up -> gui/button/mouse_up

```lisp
inputs
r0 = button object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = button object (ptr)
trashes
r1-r14
```

### button::mouse_move -> gui/button/mouse_move

```lisp
inputs
r0 = button object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = button object (ptr)
trashes
r1-r14
```

### button::lisp_create -> gui/button/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## canvas

Super Class: view

### canvas::vtable -> gui/canvas/vtable

### canvas::create -> gui/canvas/create

### canvas::create_shared -> gui/canvas/create_shared

### canvas::init -> gui/canvas/init

```lisp
inputs
r0 = canvas object (ptr)
r1 = vtable (pptr)
r2 = width (pixels)
r3 = height (pixels)
r4 = aa scale (uint)
outputs
r0 = canvas object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### canvas::init_shared -> gui/canvas/init_shared

```lisp
inputs
r0 = canvas object (ptr)
r1 = vtable (pptr)
r2 = source canvas object (ptr)
outputs
r0 = canvas object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### canvas::swap -> gui/canvas/swap

```lisp
inputs
r0 = canvas object (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::resize -> gui/canvas/resize

```lisp
inputs
r0 = canvas object (ptr)
r1 = source canvas object (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::resize_2 -> gui/canvas/resize_2

```lisp
inputs
r0 = canvas object (ptr)
r1 = source canvas object (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::resize_3 -> gui/canvas/resize_3

```lisp
inputs
r0 = canvas object (ptr)
r1 = source canvas object (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::fill -> gui/canvas/fill

```lisp
inputs
r0 = canvas object (ptr)
r1 = color (argb)
outputs
r0 = canvas object (ptr)
trashes
r1-r4
```

### canvas::to_premul -> gui/canvas/to_premul

```lisp
inputs
r1 = color (argb)
outputs
r1 = color premul (argb)
trashes
r1-r3
```

### canvas::to_argb -> gui/canvas/to_argb

```lisp
inputs
r1 = color premul (argb)
outputs
r1 = color (argb)
trashes
r1-r4
```

### canvas::as_argb -> gui/canvas/as_argb

```lisp
inputs
r0 = canvas object (ptr)
r1 = source canvas object (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r9
```

### canvas::as_premul -> gui/canvas/as_premul

```lisp
inputs
r0 = canvas object (ptr)
r1 = source canvas object (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r8
```

### canvas::set_clip -> gui/canvas/set_clip

```lisp
inputs
r0 = canvas object (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
r10 = y1 (pixels)
outputs
r0 = canvas object (ptr)
trashes
r1-r2
```

### canvas::set_edges -> gui/canvas/set_edges

```lisp
inputs
r0 = canvas object (ptr)
r1 = list of path objects (ptr)
r2 = x (fixed)
r3 = y (fixed)
r4 = y scale (int)
outputs
r0 = canvas object (ptr)
r1 = min_x (fixed)
r2 = min_y (fixed)
r3 = max_x (fixed)
r4 = max_y (fixed)
trashes
r1-r14
```

### canvas::span_noclip -> gui/canvas/span_noclip

```lisp
inputs
r0 = canvas object (ptr)
r1 = coverage (ulong)
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
outputs
r0 = canvas object (ptr)
trashes
r1-r9
info
coverage is 0x0 to 0x80
```

### canvas::span -> gui/canvas/span

```lisp
inputs
r0 = canvas object (ptr)
r1 = coverage (ulong)
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
outputs
r0 = canvas object (ptr)
trashes
r1-r9
info
coverage is 0x0 to 0x80
```

### canvas::pick -> gui/canvas/pick

```lisp
inputs
r0 = canvas object (ptr)
r7 = x (pixels)
r8 = y (pixels)
outputs
r0 = canvas object (ptr)
r1 = color (argb)
trashes
r1-r14
```

### canvas::plot -> gui/canvas/plot

```lisp
inputs
r0 = canvas object (ptr)
r7 = x (pixels)
r8 = y (pixels)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::fbox -> gui/canvas/fbox

```lisp
inputs
r0 = canvas object (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = w (pixels)
r10 = h (pixels)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::fpoly -> gui/canvas/fpoly

```lisp
inputs
r0 = canvas object (ptr)
r1 = x (fixed)
r2 = y (fixed)
r3 = winding mode (0/1)
r4 = list of path objects (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::info -> gui/canvas/info

```lisp
inputs
r0 = c string name (pubyte)
outputs
r0 = -1 if error, else width (pixels)
r1 = -1 if error, else height (pixels)
r2 = -1 if error, else type (uint)
trashes
r0-r14
```

### canvas::info_file -> gui/canvas/info_file

```lisp
inputs
r4 = c string name (pubyte)
r5 = stream object (ptr)
outputs
r0 = -1 if error, else width (pixels)
r1 = -1 if error, else height (pixels)
r2 = -1 if error, else type (uint)
trashes
r0-r14
```

### canvas::info_cpm -> gui/canvas/info_cpm

```lisp
inputs
r5 = stream object (ptr)
outputs
r0 = -1 if error, else width (pixels)
r1 = -1 if error, else height (pixels)
r2 = -1 if error, else type (uint)
trashes
r0-r14
```

### canvas::info_tga -> gui/canvas/info_tga

```lisp
inputs
r5 = stream object (ptr)
outputs
r0 = -1 if error, else width (pixels)
r1 = -1 if error, else height (pixels)
r2 = -1 if error, else type (uint)
trashes
r0-r14
```

### canvas::load -> gui/canvas/load

```lisp
inputs
r0 = c string name (pubyte)
r1 = flags (uint)
outputs
r0 = 0 if error, else shared canvas object (ptr)
trashes
r0-r14
```

### canvas::load_file -> gui/canvas/load_file

```lisp
inputs
r4 = c string name (pubyte)
r5 = stream object (ptr)
outputs
r0 = 0 if error, else canvas object (ptr)
trashes
r0-r14
```

### canvas::load_cpm -> gui/canvas/load_cpm

```lisp
inputs
r5 = stream object (ptr)
outputs
r0 = 0 if error, else canvas object (ptr)
trashes
r0-r14
```

### canvas::load_tga -> gui/canvas/load_tga

```lisp
inputs
r5 = stream object (ptr)
outputs
r0 = 0 if error, else canvas object (ptr)
trashes
r0-r14
```

### canvas::to_argb32 -> gui/canvas/to_argb32

```lisp
inputs
r1 = col (uint)
r2 = pixel type (uint)
outputs
r1 = col (uint)
trashes
r1-r8
```

### canvas::next_frame -> gui/canvas/next_frame

```lisp
inputs
r0 = canvas object (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::save -> gui/canvas/save

```lisp
inputs
r0 = canvas object (ptr)
r1 = c string name (pubyte)
r2 = format (uint)
outputs
r0 = 0 if error, else canvas object (ptr)
trashes
r0-r14
```

### canvas::save_file -> gui/canvas/save_file

```lisp
inputs
r4 = canvas object (ptr)
r5 = c string name (pubyte)
r6 = stream object (ptr)
r7 = format (uint)
outputs
r0 = 0 if error, else canvas object (ptr)
trashes
r0-r14
```

### canvas::save_cpm -> gui/canvas/save_cpm

```lisp
inputs
r4 = canvas object (ptr)
r6 = stream object (ptr)
r7 = format (uint)
outputs
r0 = canvas object (ptr)
trashes
r0-r14
```

### canvas::from_argb32 -> gui/canvas/from_argb32

```lisp
inputs
r1 = col (uint)
r2 = pixel type (uint)
outputs
r1 = col (uint)
trashes
r1-r4
```

### canvas::deinit -> gui/canvas/deinit

```lisp
inputs
r0 = canvas object (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::pref_size -> gui/canvas/pref_size

```lisp
inputs
r0 = canvas object (ptr)
outputs
r0 = canvas object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### canvas::draw -> gui/canvas/draw

```lisp
inputs
r0 = canvas object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = canvas object (ptr)
trashes
r1-r14
```

### canvas::lisp_create -> gui/canvas/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_info -> gui/canvas/lisp_info

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_load -> gui/canvas/lisp_load

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_save -> gui/canvas/lisp_save

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_next_frame -> gui/canvas/lisp_next_frame

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_swap -> gui/canvas/lisp_swap

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_fill -> gui/canvas/lisp_fill

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_plot -> gui/canvas/lisp_plot

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_fbox -> gui/canvas/lisp_fbox

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_fpoly -> gui/canvas/lisp_fpoly

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### canvas::lisp_resize -> gui/canvas/lisp_resize

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## component

Super Class: hmap

### component::vtable -> gui/component/vtable

### component::init -> gui/component/init

```lisp
inputs
r0 = component object (ptr)
r1 = vtable (pptr)
outputs
r0 = component object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### component::find_owner -> gui/component/find_owner

```lisp
inputs
r0 = component object (ptr)
outputs
r0 = component object (ptr)
r1 = 0, else mailbox id of owner (ulong)
trashes
r1-r2
```

### component::connect -> gui/component/connect

```lisp
inputs
r0 = component object (ptr)
r1 = target id (ulong)
outputs
r0 = component object (ptr)
trashes
r1-r6
```

### component::emit -> gui/component/emit

```lisp
inputs
r0 = component object (ptr)
outputs
r0 = component object (ptr)
trashes
r1-r14
```

### component::get_prop -> gui/component/get_prop

```lisp
inputs
r0 = component object (ptr)
r1 = static sym num (uint)
outputs
r0 = component object (ptr)
r1 = 0 else, property object (ptr)
trashes
r1-r14
```

### component::ref_prop -> gui/component/ref_prop

```lisp
inputs
r0 = component object (ptr)
r1 = static sym num (uint)
outputs
r0 = component object (ptr)
r1 = 0 else, property object (ptr)
trashes
r1-r14
```

### component::set_prop -> gui/component/set_prop

```lisp
inputs
r0 = component object (ptr)
r1 = static sym num (uint)
r2 = property object (ptr)
outputs
r0 = component object (ptr)
trashes
r1-r14
```

### component::set_long_prop -> gui/component/set_long_prop

```lisp
inputs
r0 = component object (ptr)
r1 = static sym num (uint)
r2 = property value (long)
outputs
r0 = component object (ptr)
trashes
r1-r14
```

### component::get_long_prop -> gui/component/get_long_prop

```lisp
inputs
r0 = component object (ptr)
r1 = static sym num (uint)
outputs
r0 = component object (ptr)
r1 = property value (long)
trashes
r1-r14
```

### component::set_font_prop -> gui/component/set_font_prop

```lisp
inputs
r0 = component object (ptr)
r1 = static sym num (uint)
r2 = font c string name (pubyte)
r3 = font size (pixels)
outputs
r0 = component object (ptr)
trashes
r1-r14
```

### component::set_str_prop -> gui/component/set_str_prop

```lisp
inputs
r0 = component object (ptr)
r1 = static sym num (uint)
r2 = c string (pubyte)
outputs
r0 = component object (ptr)
trashes
r1-r14
```

### component::deinit -> gui/component/deinit

```lisp
inputs
r0 = component object (ptr)
outputs
r0 = component object (ptr)
trashes
r1-r14
```

### component::lisp_connect -> gui/component/lisp_connect

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## ctx

Super Class: null

### ctx::box -> gui/ctx/box

```lisp
inputs
r0 = draw ctx (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
trashes
r0-r14
```

### ctx::filled_box -> gui/ctx/filled_box

```lisp
inputs
r0 = draw ctx (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
trashes
r0-r14
```

### ctx::blit -> gui/ctx/blit

```lisp
inputs
r0 = draw ctx (ptr)
r1 = texture id (ulong)
r2 = color mod (argb)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
trashes
r0-r14
```

### ctx::set_color -> gui/ctx/set_color

```lisp
inputs
r0 = draw ctx (ptr)
r1 = color (argb)
trashes
r0-r14
```

### ctx::panel -> gui/ctx/panel

```lisp
inputs
r0 = draw ctx (ptr)
r1 = color (argb)
r2 = flags (ulong)
r3 = depth (int)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
trashes
r0-r14
```

### ctx::brighter -> gui/ctx/brighter

```lisp
inputs
r1 = color (argb)
outputs
r1 = brighter color (argb)
trashes
r1-r3
```

### ctx::darker -> gui/ctx/darker

```lisp
inputs
r1 = color (argb)
outputs
r1 = darker color (argb)
trashes
r1-r3
```

## error

Super Class: obj

### error::vtable -> class/error/vtable

### error::create -> class/error/create

### error::init -> class/error/init

```lisp
inputs
r0 = error object (ptr)
r1 = vtable (pptr)
r2 = description c string (pubyte)
r3 = 0, else error msg index (uint)
r4 = error payload object (ptr)
r5 = filename c string (pubyte)
r6 = line number (uint)
outputs
r0 = error object (ptr)
r1 = 0 if error, else ok
trashes
r1-r6
```

### error::get_description -> class/error/get_description

```lisp
inputs
r0 = error object (ptr)
outputs
r0 = error object (ptr)
r1 = str object (ptr)
trashes
r1
```

### error::get_msg -> class/error/get_msg

```lisp
inputs
r0 = error object (ptr)
outputs
r0 = error object (ptr)
r1 = error c string (pubyte)
trashes
r1-r5
```

### error::get_object -> class/error/get_object

```lisp
inputs
r0 = error object (ptr)
outputs
r0 = error object (ptr)
r1 = error payload object (ptr)
trashes
r1
```

### error::get_file -> class/error/get_file

```lisp
inputs
r0 = error object (ptr)
outputs
r0 = error object (ptr)
r1 = str object (ptr)
trashes
r1
```

### error::get_line -> class/error/get_line

```lisp
inputs
r0 = error object (ptr)
outputs
r0 = error object (ptr)
r1 = line number (uint)
trashes
r1
```

### error::deinit -> class/error/deinit

```lisp
inputs
r0 = error object (ptr)
outputs
r0 = error object (ptr)
trashes
r1-r14
```

## fixed

Super Class: num

### fixed::vtable -> class/fixed/vtable

### fixed::create -> class/fixed/create

### fixed::print -> class/fixed/print

```lisp
inputs
r0 = fixed object (ptr)
r1 = stream object (ptr)
outputs
r0 = fixed object (ptr)
trashes
r1-r14
```

### fixed::vcreate -> class/fixed/create

### fixed::mul -> class/fixed/mul

```lisp
inputs
r0 = fixed object (ptr)
r1 = list of fixed objects (ptr)
outputs
r0 = fixed object (ptr)
r1 = result fixed object (ptr)
trashes
r1-r14
```

### fixed::div -> class/fixed/div

```lisp
inputs
r0 = fixed object (ptr)
r1 = list of fixed objects (ptr)
outputs
r0 = fixed object (ptr)
r1 = 0 if error, else result fixed object (ptr)
trashes
r1-r14
```

### fixed::mod -> class/fixed/mod

```lisp
inputs
r0 = fixed object (ptr)
r1 = list of fixed objects (ptr)
outputs
r0 = fixed object (ptr)
r1 = 0 if error, else result fixed object (ptr)
trashes
r1-r14
```

### fixed::sign -> class/fixed/sign

```lisp
inputs
r0 = fixed object (ptr)
outputs
r0 = fixed object (ptr)
r1 = 0 if error, else result fixed object (ptr)
trashes
r1-r14
```

### fixed::sqrt -> class/fixed/sqrt

```lisp
inputs
r0 = fixed object (ptr)
outputs
r0 = fixed object (ptr)
r1 = result fixed object (ptr)
trashes
r1-r14
```

### fixed::frac -> class/fixed/frac

```lisp
inputs
r0 = fixed object (ptr)
outputs
r0 = fixed object (ptr)
r1 = result fixed object (ptr)
trashes
r1-r14
```

### fixed::floor -> class/fixed/floor

```lisp
inputs
r0 = fixed object (ptr)
outputs
r0 = fixed object (ptr)
r1 = result fixed object (ptr)
trashes
r1-r14
```

### fixed::recip -> class/fixed/recip

```lisp
inputs
r0 = fixed object (ptr)
outputs
r0 = fixed object (ptr)
r1 = result fixed object (ptr)
trashes
r1-r14
```

### fixed::sin -> class/fixed/sin

```lisp
inputs
r0 = fixed object (ptr)
outputs
r0 = fixed object (ptr)
r1 = result fixed object (ptr)
trashes
r1-r14
```

### fixed::cos -> class/fixed/cos

```lisp
inputs
r0 = fixed object (ptr)
outputs
r0 = fixed object (ptr)
r1 = result fixed object (ptr)
trashes
r1-r14
```

### fixed::lisp_sin -> class/fixed/lisp_sin

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### fixed::lisp_cos -> class/fixed/lisp_cos

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### fixed::lisp_frac -> class/fixed/lisp_frac

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### fixed::lisp_floor -> class/fixed/lisp_floor

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### fixed::lisp_recip -> class/fixed/lisp_recip

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## fixeds

Super Class: nums

### fixeds::vtable -> class/fixeds/vtable

### fixeds::create -> class/fixeds/create

### fixeds::vcreate -> class/fixeds/create

### fixeds::velement -> class/fixed/create

### fixeds::mul -> class/fixeds/mul

```lisp
inputs
r0 = fixeds object (ptr)
r1 = source1 fixeds object, can be same (ptr)
r2 = source2 fixeds object, can be same (ptr)
outputs
r0 = fixeds object (ptr)
trashes
r1-r6
```

### fixeds::div -> class/fixeds/div

```lisp
inputs
r0 = fixeds object (ptr)
r1 = source1 fixeds object, can be same (ptr)
r2 = source2 fixeds object, can be same (ptr)
outputs
r0 = fixeds object (ptr)
trashes
r1-r8
```

### fixeds::mod -> class/fixeds/mod

```lisp
inputs
r0 = fixeds object (ptr)
r1 = source1 fixeds object, can be same (ptr)
r2 = source2 fixeds object, can be same (ptr)
outputs
r0 = fixeds object (ptr)
trashes
r1-r8
```

### fixeds::scale -> class/fixeds/scale

```lisp
inputs
r0 = fixeds object (ptr)
r1 = source fixeds object, can be same (ptr)
r2 = scale (fixed)
outputs
r0 = fixeds object (ptr)
trashes
r1-r5
```

### fixeds::frac -> class/fixeds/frac

```lisp
inputs
r0 = fixeds object (ptr)
r1 = source fixeds object, can be same (ptr)
outputs
r0 = fixeds object (ptr)
trashes
r1-r5
```

### fixeds::floor -> class/fixeds/floor

```lisp
inputs
r0 = fixeds object (ptr)
r1 = source fixeds object, can be same (ptr)
outputs
r0 = fixeds object (ptr)
trashes
r1-r5
```

### fixeds::lisp_frac -> class/fixeds/lisp_frac

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### fixeds::lisp_floor -> class/fixeds/lisp_floor

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## flow

Super Class: view

### flow::vtable -> gui/flow/vtable

### flow::create -> gui/flow/create

### flow::pref_size -> gui/flow/pref_size

```lisp
inputs
r0 = flow object (ptr)
outputs
r0 = flow object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### flow::layout -> gui/flow/layout

```lisp
inputs
r0 = flow object (ptr)
outputs
r0 = flow object (ptr)
trashes
r1-r14
```

### flow::lisp_create -> gui/flow/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## font

Super Class: obj

### font::vtable -> gui/font/vtable

### font::statics -> gui/font/statics

```lisp
info
font static data
```

### font::open -> gui/font/open

```lisp
r0 = name c string (pubyte)
r1 = font size (pixels)
outputs
r0 = 0 if error, else font object (ptr)
trashes
r0-r14
```

### font::create -> gui/font/create

### font::init -> gui/font/init

```lisp
inputs
r0 = font object (ptr)
r1 = vtable (pptr)
r2 = name c string (pubyte)
r3 = 0, else ctf data string object (ptr)
r4 = font size (pixels)
outputs
r0 = font object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### font::flush -> gui/font/flush

```lisp
trashes
r0-r14
```

### font::sym_texture -> gui/font/sym_texture

```lisp
inputs
r0 = font object (ptr)
r1 = utf8 encoded sym object (ptr)
outputs
r0 = font object (ptr)
r1 = 0, else texture object (ptr)
trashes
r1-r14
```

### font::ascii_textures -> gui/font/ascii_textures

```lisp
inputs
r0 = font object (ptr)
outputs
r0 = font object (ptr)
r1 = list of ascii texture objects (ptr)
trashes
r1-r14
```

### font::get_metrics -> gui/font/get_metrics

```lisp
inputs
r0 = font object (ptr)
outputs
r0 = font object (ptr)
r1 = ascent (pixels)
r2 = descent (pixels)
r3 = height (pixels)
trashes
r1-r4
```

### font::glyph_data -> gui/font/glyph_data

```lisp
inputs
r0 = font object (ptr)
r1 = char code (uint)
outputs
r0 = font object (ptr)
r1 = 0, else glyph data pointer (ptr)
trashes
r1-r4
```

### font::glyph_ranges -> gui/font/glyph_ranges

```lisp
inputs
r0 = font object (ptr)
outputs
r0 = font object (ptr)
r1 = glyph ranges array object (ptr)
trashes
r1-r7
```

### font::glyph_info -> gui/font/glyph_info

```lisp
inputs
r0 = font object (ptr)
r1 = utf8 encoded str object (ptr)
outputs
r0 = font object (ptr)
r1 = glyph info array object (ptr)
trashes
r1-r8
```

### font::glyph_paths -> gui/font/glyph_paths

```lisp
inputs
r0 = font object (ptr)
r1 = stack array object (ptr)
r2 = glyph info array object (ptr)
outputs
r0 = font object (ptr)
r1 = glyph paths list object (ptr)
r2 = width (pixels)
r3 = height (pixels)
trashes
r1-r14
```

### font::glyph_bounds -> gui/font/glyph_bounds

```lisp
inputs
r0 = font object (ptr)
r1 = glyph info array object (ptr)
outputs
r0 = font object (ptr)
r1 = width (pixels)
r2 = height (pixels)
trashes
r1-r7
```

### font::deinit -> gui/font/deinit

```lisp
inputs
r0 = font object (ptr)
outputs
r0 = font object (ptr)
trashes
r1-r14
```

### font::lisp_create -> gui/font/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### font::lisp_glyph_ranges -> gui/font/lisp_glyph_ranges

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### font::lisp_glyph_paths -> gui/font/lisp_glyph_paths

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## fstream

Super Class: stream

### fstream::vtable -> class/fstream/vtable

### fstream::create -> class/fstream/create

### fstream::init -> class/fstream/init

```lisp
inputs
r0 = fstream object (ptr)
r1 = vtable (pptr)
r2 = c string filename (pubyte)
r3 = open mode (uint)
outputs
r0 = fstream object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### fstream::deinit -> class/fstream/deinit

```lisp
inputs
r0 = fstream object (ptr)
outputs
r0 = fstream object (ptr)
trashes
r1-r14
```

### fstream::read_next -> class/fstream/read_next

```lisp
inputs
r0 = fstream object (ptr)
outputs
r0 = fstream object (ptr)
r1 = -1 for EOF, else more data
trashes
r1-r14
```

### fstream::write_next -> class/fstream/write_flush

```lisp
inputs
r0 = fstream object (ptr)
outputs
r0 = fstream object (ptr)
trashes
r1-r14
```

### fstream::write_flush -> class/fstream/write_flush

```lisp
inputs
r0 = fstream object (ptr)
outputs
r0 = fstream object (ptr)
trashes
r1-r14
```

## func

Super Class: obj

### func::vtable -> class/func/vtable

### func::create -> class/func/create

### func::init -> class/num/init

```lisp
inputs
r0 = num object (ptr)
r1 = vtable (pptr)
r2 = initial value (long)
outputs
r0 = num object (ptr)
r1 = 0 if error, else ok
trashes
r1
```

### func::print -> class/func/print

```lisp
inputs
r0 = func object (ptr)
r1 = stream object (ptr)
outputs
r0 = func object (ptr)
trashes
r1-r14
```

## grid

Super Class: view

### grid::vtable -> gui/grid/vtable

### grid::create -> gui/grid/create

### grid::pref_size -> gui/grid/pref_size

```lisp
inputs
r0 = grid object (ptr)
outputs
r0 = grid object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### grid::layout -> gui/grid/layout

```lisp
inputs
r0 = grid object (ptr)
outputs
r0 = grid object (ptr)
trashes
r1-r14
```

### grid::lisp_create -> gui/grid/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## gui

Super Class: null

### gui::statics -> gui/gui/statics

### gui::statics_init -> gui/gui/statics_init

### gui::update -> gui/gui/update

```lisp
inputs
r0 = root view object (ptr)
trashes
r0-r14
```

### gui::gui -> gui/gui/gui

```lisp
gui process
```

### gui::lisp_add -> gui/gui/lisp_add

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### gui::lisp_add_back -> gui/gui/lisp_add_back

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### gui::lisp_info -> gui/gui/lisp_info

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## hmap

Super Class: hset

### hmap::vtable -> class/hmap/vtable

### hmap::create -> class/hmap/create

### hmap::init -> class/hmap/init

```lisp
inputs
r0 = hmap object (ptr)
r1 = vtable (pptr)
r2 = 0, else key compare callback (ptr)
r3 = num buckets (uint)
outputs
r0 = hmap object (ptr)
r1 = 0 if error, else ok
trashes
r1-r7
```

### hmap::find -> class/hmap/find

```lisp
inputs
r0 = hmap object (ptr)
r1 = key object (ptr)
outputs
r0 = hmap object (ptr)
r1 = 0, else found iterator (pptr)
r2 = bucket list (ptr)
trashes
r1-r14
```

### hmap::copy -> class/hmap/copy

```lisp
inputs
r0 = hmap object (ptr)
r1 = num buckets (uint)
outputs
r0 = hmap object (ptr)
r1 = hmap copy object (ptr)
trashes
r1-r14
```

### hmap::list -> class/hmap/list

```lisp
inputs
r0 = hmap object (ptr)
outputs
r0 = hmap object (ptr)
r1 = list object (ptr)
trashes
r1-r14
```

### hmap::insert -> class/hmap/insert

```lisp
inputs
r0 = hmap object (ptr)
r1 = key object (ptr)
r2 = value object (ptr)
outputs
r0 = hmap object (ptr)
r1 = iterator (pptr)
r2 = bucket list (ptr)
trashes
r1-r14
```

### hmap::search -> class/hmap/search

```lisp
inputs
r0 = hmap object (ptr)
r1 = key object (ptr)
outputs
r0 = hmap object (ptr)
r1 = 0, else iterator (pptr)
r2 = bucket list (ptr)
trashes
r1-r14
```

### hmap::set -> class/hmap/set

```lisp
inputs
r0 = hmap object (ptr)
r1 = key object (ptr)
r2 = value object (ptr)
outputs
r0 = hmap object (ptr)
r1 = 0 if not found, else value object (ptr)
trashes
r1-r14
```

### hmap::get -> class/hmap/get

```lisp
inputs
r0 = hmap object (ptr)
r1 = key object (ptr)
outputs
r0 = hmap object (ptr)
r1 = 0 if not found, else value object (ptr)
trashes
r1-r14
```

### hmap::set_parent -> class/hmap/set_parent

```lisp
inputs
r0 = hmap object (ptr)
r1 = 0, else hmap parent object (ptr)
outputs
r0 = hmap object (ptr)
trashes
r1-r14
```

### hmap::deinit -> class/hmap/deinit

```lisp
inputs
r0 = hmap object (ptr)
outputs
r0 = hmap object (ptr)
trashes
r1-r14
```

### hmap::lisp_env -> class/hmap/lisp_env

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = environment hmap object (ptr)
trashes
r1-r14
```

### hmap::lisp_def -> class/hmap/lisp_def

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### hmap::lisp_defq -> class/hmap/lisp_defq

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### hmap::lisp_set -> class/hmap/lisp_set

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### hmap::lisp_setq -> class/hmap/lisp_setq

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### hmap::lisp_get -> class/hmap/lisp_get

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### hmap::lisp_undef -> class/hmap/lisp_undef

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### hmap::lisp_parent -> class/hmap/lisp_parent

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### hmap::lisp_list -> class/hmap/lisp_list

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = environment hmap object (ptr)
trashes
r1-r14
```

## host

Super Class: null

### host::sdl_set_main_ready -> nil

### host::sdl_init -> nil

### host::sdl_get_error -> nil

### host::sdl_quit -> nil

### host::sdl_create_window -> nil

### host::sdl_create_window_and_renderer -> nil

### host::sdl_destroy_window -> nil

### host::sdl_delay -> nil

### host::sdl_create_renderer -> nil

### host::sdl_set_render_draw_color -> nil

### host::sdl_render_fill_rect -> nil

### host::sdl_render_present -> nil

### host::sdl_render_set_clip_rect -> nil

### host::sdl_set_render_draw_blend_mode -> nil

### host::sdl_poll_event -> nil

### host::sdl_render_draw_rect -> nil

### host::sdl_free_surface -> nil

### host::sdl_create_texture_from_surface -> nil

### host::sdl_destroy_texture -> nil

### host::sdl_render_copy -> nil

### host::sdl_set_texture_blend_mode -> nil

### host::sdl_set_texture_color_mod -> nil

### host::sdl_create_rgb_surface_from -> nil

### host::sdl_compose_custom_blend_mode -> nil

### host::sdl_create_texture -> nil

### host::sdl_set_render_target -> nil

### host::sdl_render_clear -> nil

### host::exit -> nil

### host::stat -> nil

### host::open -> nil

### host::close -> nil

### host::unlink -> nil

### host::read -> nil

### host::write -> nil

### host::mmap -> nil

### host::munmap -> nil

### host::mprotect -> nil

### host::gettime -> nil

### host::open_shared -> nil

### host::close_shared -> nil

### host::clear_icache -> nil

### host::dirlist -> nil

### host::remove -> nil

## hset

Super Class: obj

### hset::vtable -> class/hset/vtable

### hset::create -> class/hset/create

### hset::init -> class/hset/init

```lisp
inputs
r0 = hset object (ptr)
r1 = vtable (pptr)
r2 = 0, else key compare callback (ptr)
r3 = num buckets (uint)
outputs
r0 = hset object (ptr)
r1 = 0 if error, else ok
trashes
r1-r5
```

### hset::get_bucket -> class/hset/get_bucket

```lisp
inputs
r0 = hset object (ptr)
r1 = key object (ptr)
outputs
r0 = hset object (ptr)
r1 = bucket list object (ptr)
trashes
r1-r14
```

### hset::clear -> class/hset/clear

```lisp
inputs
r0 = hset object (ptr)
outputs
r0 = hset object (ptr)
trashes
r1-r14
```

### hset::for_each -> class/hset/for_each

```lisp
inputs
r0 = hset object (ptr)
r1 = predicate function (ptr)
r2 = predicate data (ptr)
outputs
r0 = hset object (ptr)
trashes
r1-r2...
callback predicate
inputs
r0 = predicate data (ptr)
r1 = element iterator (pptr)
trashes
...
```

### hset::find -> class/hset/find

```lisp
inputs
r0 = hset object (ptr)
r1 = key object (ptr)
outputs
r0 = hset object (ptr)
r1 = 0, else found iterator (pptr)
r2 = bucket list object (ptr)
trashes
r1-r14
```

### hset::insert -> class/hset/insert

```lisp
inputs
r0 = hset object (ptr)
r1 = key object (ptr)
outputs
r0 = hset object (ptr)
r1 = element iterator (pptr)
r2 = bucket list object (ptr)
trashes
r1-r14
```

### hset::erase -> class/hset/erase

```lisp
inputs
r0 = hset object (ptr)
r1 = element iterator (pptr)
r2 = bucket list object (ptr)
outputs
r0 = hset object (ptr)
trashes
r1-r14
```

### hset::copy -> class/hset/copy

```lisp
inputs
r0 = hset object (ptr)
r1 = num buckets (uint)
outputs
r0 = hset object (ptr)
r1 = hset copy object (ptr)
trashes
r1-r14
```

### hset::key_callback -> class/obj/null

### hset::each_callback -> class/obj/null

### hset::print -> class/hset/print

```lisp
inputs
r0 = hset object (ptr)
r1 = stream object (ptr)
outputs
r0 = hset object (ptr)
trashes
r1-r14
```

### hset::deinit -> class/hset/deinit

```lisp
inputs
r0 = hset object (ptr)
outputs
r0 = hset object (ptr)
trashes
r1-r14
```

## in

Super Class: stream

### in::vtable -> class/in/vtable

### in::create -> class/in/create

### in::init -> class/in/init

```lisp
inputs
r0 = in object (ptr)
r1 = vtable (pptr)
r2 = 0, else mailbox id (uint)
outputs
r0 = in object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### in::next_msg -> class/in/next_msg

```lisp
inputs
r0 = in object (ptr)
outputs
r0 = in object (ptr)
trashes
r1-r14
```

### in::deinit -> class/in/deinit

```lisp
inputs
r0 = in object (ptr)
outputs
r0 = in object (ptr)
trashes
r1-r14
```

### in::read_next -> class/in/read_next

```lisp
inputs
r0 = in object (ptr)
outputs
r0 = in object (ptr)
r1 = -1 for EOF, else more data
trashes
r1-r14
```

### in::lisp_create -> class/in/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### in::lisp_next_msg -> class/in/lisp_next_msg

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## label

Super Class: view

### label::vtable -> gui/label/vtable

### label::create -> gui/label/create

### label::init -> gui/label/init

```lisp
inputs
r0 = label object (ptr)
r1 = vtable (pptr)
outputs
r0 = label object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### label::pref_size -> gui/label/pref_size

```lisp
inputs
r0 = label object (ptr)
outputs
r0 = label object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### label::draw -> gui/label/draw

```lisp
inputs
r0 = label object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = label object (ptr)
trashes
r1-r14
```

### label::layout -> gui/label/layout

```lisp
inputs
r0 = label object (ptr)
outputs
r0 = label object (ptr)
trashes
r1-r14
```

### label::add_child -> gui/label/add_child

```lisp
inputs
r0 = label object (ptr)
r1 = child view object (ptr)
outputs
r0 = label object (ptr)
trashes
r1-r14
```

### label::lisp_create -> gui/label/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## lisp

Super Class: obj

### lisp::vtable -> class/lisp/vtable

### lisp::create -> class/lisp/create

### lisp::init -> class/lisp/init

```lisp
inputs
r0 = lisp object object (ptr)
r1 = vtable (pptr)
r2 = stdin stream object (ptr)
r3 = stdout stream object (ptr)
r4 = stderr stream object (ptr)
outputs
r0 = lisp object object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### lisp::deinit -> class/lisp/deinit

```lisp
inputs
r0 = lisp object (ptr)
outputs
r0 = lisp object (ptr)
trashes
r1-r14
```

### lisp::env_push -> class/lisp/env_push

```lisp
inputs
r0 = lisp object (ptr)
outputs
r0 = lisp object (ptr)
trashes
r1-r14
```

### lisp::env_pop -> class/lisp/env_pop

```lisp
inputs
r0 = lisp object (ptr)
outputs
r0 = lisp object (ptr)
trashes
r1-r14
```

### lisp::env_bind -> class/lisp/env_bind

```lisp
inputs
r0 = lisp object (ptr)
r1 = vars list object (ptr)
r2 = vals seq object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::env_args_set -> class/lisp/env_args_set

```lisp
inputs
r0 = args list object (ptr)
r3 = args offset (uint)
r5 = args dest (ptr)
trashes
r0-r5
```

### lisp::env_args_sig -> class/lisp/env_args_sig

```lisp
inputs
r1 = args list object (ptr)
r3 = signiture pointer (pushort)
r4 = number of args (int)
outputs
r2 = 0 if error, else ok
trashes
r2-r7
```

### lisp::env_args_type -> class/lisp/env_args_type

```lisp
inputs
r1 = args list object (ptr)
r3 = vtable pointer (ptr)
r4 = minimum number of args (int)
outputs
r2 = 0 if error, else ok
trashes
r2-r7
```

### lisp::env_args_match -> class/lisp/env_args_match

```lisp
inputs
r1 = args list object (ptr)
r3 = vtable pointer (ptr)
r4 = minimum number of args (int)
outputs
r2 = 0 if error, else ok
trashes
r2-r7
```

### lisp::read -> class/lisp/read

```lisp
inputs
r0 = lisp object (ptr)
r1 = stream object (ptr)
r2 = next char (uint)
outputs
r0 = lisp object (ptr)
r1 = form object (ptr)
r2 = next char (uint)
trashes
r1-r14
```

### lisp::read_char -> class/lisp/read_char

```lisp
inputs
r0 = lisp object (ptr)
r1 = stream object (ptr)
r2 = last char (uint)
outputs
r0 = lisp object (ptr)
r1 = next char (uint)
trashes
r1-r14
```

### lisp::read_rmacro -> class/lisp/read_rmacro

```lisp
inputs
r0 = lisp object (ptr)
r1 = stream object (ptr)
r2 = next char (uint)
r3 = sym object (ptr)
outputs
r0 = lisp object (ptr)
r1 = list list object (ptr)
r2 = next char (uint)
trashes
r1-r14
```

### lisp::read_list -> class/lisp/read_list

```lisp
inputs
r0 = lisp object (ptr)
r1 = stream object (ptr)
r2 = next char (uint)
outputs
r0 = lisp object (ptr)
r1 = list list object (ptr)
r2 = next char (uint)
trashes
r1-r14
```

### lisp::read_sym -> class/lisp/read_sym

```lisp
inputs
r0 = lisp object (ptr)
r1 = stream object (ptr)
r2 = next char (uint)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
r2 = next char (uint)
trashes
r1-r14
```

### lisp::read_str -> class/lisp/read_str

```lisp
inputs
r0 = lisp object (ptr)
r1 = stream object (ptr)
r2 = close char (uint)
outputs
r0 = lisp object (ptr)
r1 = str object (ptr)
r2 = next char (uint)
trashes
r1-r14
```

### lisp::read_num -> class/lisp/read_num

```lisp
inputs
r0 = lisp object (ptr)
r1 = stream object (ptr)
r2 = next char (uint)
outputs
r0 = lisp object (ptr)
r1 = num object (ptr)
r2 = next char (uint)
trashes
r1-r14
```

### lisp::repl_eval -> class/lisp/repl_eval

```lisp
inputs
r0 = lisp object (ptr)
r1 = form object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::repl_eval_list -> class/lisp/repl_eval_list

```lisp
inputs
r0 = lisp object (ptr)
r1 = list list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::repl_apply -> class/lisp/repl_apply

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
r2 = func object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::repl_print -> class/lisp/repl_print

```lisp
inputs
r0 = lisp object (ptr)
r1 = stream object (ptr)
r2 = value
outputs
r0 = lisp object (ptr)
trashes
r1-r14
```

### lisp::repl_expand -> class/lisp/repl_expand

```lisp
inputs
r0 = lisp object (ptr)
r1 = form object iter (pptr)
outputs
r0 = lisp object (ptr)
trashes
r1-r14
```

### lisp::repl_error -> class/lisp/repl_error

```lisp
inputs
r0 = lisp object (ptr)
r1 = description c string (pubyte)
r2 = 0, else error msg number (uint)
r3 = error payload object (ptr)
outputs
r0 = lisp object (ptr)
r1 = error object (ptr)
trashes
r1-r14
```

### lisp::lisp_ffi -> class/lisp/lisp_ffi

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_prebind -> class/lisp/lisp_bindfun

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_macroexpand -> class/lisp/lisp_macroexpand

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_lambda -> class/lisp/lisp_lambda

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_quote -> class/lisp/lisp_quote

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_qquote -> class/lisp/lisp_qquote

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_eql -> class/lisp/lisp_eql

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_cond -> class/lisp/lisp_cond

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_progn -> class/lisp/lisp_progn

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_while -> class/lisp/lisp_while

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_print -> class/lisp/lisp_print

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_prin -> class/lisp/lisp_prin

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_copy -> class/lisp/lisp_copy

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_apply -> class/lisp/lisp_apply

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_repl -> class/lisp/lisp_repl

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_eval -> class/lisp/lisp_eval

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_throw -> class/lisp/lisp_throw

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_catch -> class/lisp/lisp_catch

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_bind -> class/lisp/lisp_bind

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_read -> class/lisp/lisp_read

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::lisp_type -> class/lisp/lisp_type

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### lisp::run -> class/lisp/run

```lisp
lisp run loop task
inputs
msg of lisp filename
```

## list

Super Class: array

### list::vtable -> class/list/vtable

### list::create -> class/list/create

### list::vcreate -> class/list/create

### list::deinit -> class/list/deinit

```lisp
inputs
r0 = list object (ptr)
outputs
r0 = list object (ptr)
trashes
r1-r14
```

### list::ref_element -> class/list/ref_element

```lisp
inputs
r0 = list object (ptr)
r1 = element index (uint)
outputs
r0 = list object (ptr)
r1 = element object (ptr)
trashes
r1-r2
```

### list::slice -> class/list/slice

```lisp
inputs
r0 = list object (ptr)
r1 = element start index (uint)
r2 = element end index (uint)
outputs
r0 = list object (ptr)
r1 = slice list object (ptr)
trashes
r1-r8
```

### list::clear -> class/list/clear

```lisp
inputs
r0 = list object (ptr)
outputs
r0 = list object (ptr)
trashes
r1-r14
```

### list::ref_back -> class/list/ref_back

```lisp
inputs
r0 = list object (ptr)
outputs
r0 = list object (ptr)
r1 = element object (ptr)
trashes
r1-r2
```

### list::set_element -> class/list/set_element

```lisp
inputs
r0 = list object (ptr)
r1 = element object (ptr)
r2 = element index (uint)
outputs
r0 = list object (ptr)
trashes
r1-r14
```

### list::append -> class/list/append

```lisp
inputs
r0 = list object (ptr)
r1 = source list object (ptr)
r2 = element start index (uint)
r3 = element end index (uint)
outputs
r0 = list object (ptr)
trashes
r1-r9
```

### list::print -> class/list/print

```lisp
inputs
r0 = list object (ptr)
r1 = stream object (ptr)
outputs
r0 = list object (ptr)
trashes
r1-r14
```

### list::lisp_list -> class/list/lisp_list

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### list::lisp_elemset -> class/list/lisp_elemset

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### list::lisp_merge -> class/list/lisp_merge

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### list::lisp_part -> class/list/lisp_part

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### list::lisp_match -> class/list/lisp_match

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## num

Super Class: obj

### num::vtable -> class/num/vtable

### num::create -> class/num/create

### num::init -> class/num/init

```lisp
inputs
r0 = num object (ptr)
r1 = vtable (pptr)
r2 = initial value (long)
outputs
r0 = num object (ptr)
r1 = 0 if error, else ok
trashes
r1
```

### num::get_value -> class/num/get_value

```lisp
inputs
r0 = num object (ptr)
outputs
r0 = num object (ptr)
r1 = value (long)
trashes
r1
```

### num::set_value -> class/num/set_value

```lisp
inputs
r0 = num object (ptr)
r1 = value (long)
outputs
r0 = num object (ptr)
r1 = value (long)
trashes
none
```

### num::print -> class/num/print

```lisp
inputs
r0 = num object (ptr)
r1 = stream object (ptr)
outputs
r0 = num object (ptr)
trashes
r1-r14
```

### num::vcreate -> class/num/create

### num::add -> class/num/add

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::sub -> class/num/sub

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::mul -> class/num/mul

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::min -> class/num/min

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::max -> class/num/max

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::div -> class/num/div

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = 0 if error, else result num object (ptr)
trashes
r1-r14
```

### num::mod -> class/num/mod

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = 0 if error, else result num object (ptr)
trashes
r1-r14
```

### num::sqrt -> class/num/sqrt

```lisp
inputs
r0 = num object (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::abs -> class/num/abs

```lisp
inputs
r0 = num object (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::sign -> class/num/sign

```lisp
inputs
r0 = num object (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::neg -> class/num/neg

```lisp
inputs
r0 = num object (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::random -> class/num/random

```lisp
inputs
r0 = num object (ptr)
outputs
r0 = num object (ptr)
r1 = result num object (ptr)
trashes
r1-r14
```

### num::eq -> class/num/eq

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### num::ne -> class/num/ne

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### num::lt -> class/num/lt

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### num::gt -> class/num/gt

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### num::le -> class/num/le

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### num::ge -> class/num/ge

```lisp
inputs
r0 = num object (ptr)
r1 = list of num objects (ptr)
outputs
r0 = num object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### num::lisp_add -> class/num/lisp_add

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_sub -> class/num/lisp_sub

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_mul -> class/num/lisp_mul

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_div -> class/num/lisp_div

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_mod -> class/num/lisp_mod

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_min -> class/num/lisp_min

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_max -> class/num/lisp_max

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_abs -> class/num/lisp_abs

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_neg -> class/num/lisp_neg

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_sign -> class/num/lisp_sign

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_sqrt -> class/num/lisp_sqrt

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_random -> class/num/lisp_random

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_eq -> class/num/lisp_eq

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_ne -> class/num/lisp_ne

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_lt -> class/num/lisp_lt

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_gt -> class/num/lisp_gt

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_le -> class/num/lisp_le

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_ge -> class/num/lisp_ge

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_and -> class/num/lisp_and

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_or -> class/num/lisp_or

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_xor -> class/num/lisp_xor

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_shr -> class/num/lisp_shr

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_asr -> class/num/lisp_asr

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_shl -> class/num/lisp_shl

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_i2f -> class/num/lisp_i2f

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_i2r -> class/num/lisp_i2r

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_f2i -> class/num/lisp_f2i

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_f2r -> class/num/lisp_f2r

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_r2i -> class/num/lisp_r2i

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::lisp_r2f -> class/num/lisp_r2f

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### num::hash -> class/num/hash

```lisp
inputs
r0 = num (ptr)
outputs
r0 = num (ptr)
r1 = hash code (ulong)
trashes
r1-r14
```

## nums

Super Class: array

### nums::vtable -> class/nums/vtable

### nums::create -> class/nums/create

### nums::vcreate -> class/nums/create

### nums::add -> class/nums/add

```lisp
inputs
r0 = nums object (ptr)
r1 = source1 nums object, can be same (ptr)
r2 = source2 nums object, can be same (ptr)
outputs
r0 = nums object (ptr)
trashes
r1-r6
```

### nums::sub -> class/nums/sub

```lisp
inputs
r0 = nums object (ptr)
r1 = source1 nums object, can be same (ptr)
r2 = source2 nums object, can be same (ptr)
outputs
r0 = nums object (ptr)
trashes
r1-r6
```

### nums::mul -> class/nums/mul

```lisp
inputs
r0 = nums object (ptr)
r1 = source1 nums object, can be same (ptr)
r2 = source2 nums object, can be same (ptr)
outputs
r0 = nums object (ptr)
trashes
r1-r6
```

### nums::div -> class/nums/div

```lisp
inputs
r0 = nums object (ptr)
r1 = source1 nums object, can be same (ptr)
r2 = source2 nums object, can be same (ptr)
outputs
r0 = nums object (ptr)
trashes
r1-r8
```

### nums::mod -> class/nums/mod

```lisp
inputs
r0 = nums object (ptr)
r1 = source1 nums object, can be same (ptr)
r2 = source2 nums object, can be same (ptr)
outputs
r0 = nums object (ptr)
trashes
r1-r8
```

### nums::abs -> class/nums/abs

```lisp
inputs
r0 = nums object (ptr)
r1 = source nums object, can be same (ptr)
outputs
r0 = nums object (ptr)
trashes
r1-r4
```

### nums::sum -> class/nums/sum

```lisp
inputs
r0 = nums object (ptr)
outputs
r0 = nums object (ptr)
r1 = sum (long)
trashes
r1-r4
```

### nums::scale -> class/nums/scale

```lisp
inputs
r0 = nums object (ptr)
r1 = source nums object, can be same (ptr)
r2 = scale (int)
outputs
r0 = nums object (ptr)
trashes
r1-r5
```

### nums::lisp_vecop1 -> class/nums/lisp_vecop1

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
r2 = nums method (ptr)
outputs
r0 = lisp object (ptr)
r1 = 0 if error, else value object (ptr)
trashes
r1-r14
```

### nums::lisp_vecop2 -> class/nums/lisp_vecop2

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
r2 = nums method (ptr)
outputs
r0 = lisp object (ptr)
r1 = 0 if error, else value object (ptr)
trashes
r1-r14
```

### nums::lisp_add -> class/nums/lisp_add

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### nums::lisp_sub -> class/nums/lisp_sub

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### nums::lisp_mul -> class/nums/lisp_mul

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### nums::lisp_div -> class/nums/lisp_div

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### nums::lisp_mod -> class/nums/lisp_mod

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### nums::lisp_sum -> class/nums/lisp_sum

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### nums::lisp_scale -> class/nums/lisp_scale

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### nums::lisp_abs -> class/nums/lisp_abs

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## obj

Super Class: null

### obj::vtable -> class/obj/vtable

### obj::null -> class/obj/null

### obj::destroy -> class/obj/destroy

```lisp
inputs
r0 = object (ptr)
trashes
r0-r14
```

### obj::init -> class/obj/init

```lisp
inputs
r0 = object (ptr)
r1 = vtable (pptr)
outputs
r0 = object (ptr)
r1 = 0 if error, else ok
trashes
r1
```

### obj::inst_of -> class/obj/inst_of

```lisp
inputs
r0 = object (ptr)
r1 = vtable of tested type (ptr)
outputs
r0 = object (ptr)
r1 = 0 if not, else vtable of object (ptr)
trashes
r1-r2
```

### obj::ref -> class/obj/ref

```lisp
inputs
r0 = object (ptr)
outputs
r0 = object (ptr)
trashes
r1
```

### obj::deref -> class/obj/deref

```lisp
inputs
r0 = object (ptr)
trashes
r0-r14
```

### obj::ref_if -> class/obj/ref_if

```lisp
inputs
r0 = 0, else object (ptr)
outputs
r0 = 0, else object (ptr)
trashes
r1
```

### obj::deref_if -> class/obj/deref_if

```lisp
inputs
r0 = 0, else object (ptr)
trashes
r0-r14
```

### obj::print -> class/obj/print

```lisp
inputs
r0 = object (ptr)
r1 = stream object (ptr)
outputs
r0 = object (ptr)
trashes
r1-r14
```

### obj::hash -> class/obj/hash

```lisp
inputs
r0 = object (ptr)
outputs
r0 = object (ptr)
r1 = hash code (ulong)
trashes
r1-r14
```

### obj::deinit -> class/obj/deinit

```lisp
inputs
r0 = object (ptr)
trashes
r0-r14
```

### obj::deinit -> class/obj/null

### obj::lisp_get_field -> class/obj/lisp_get_field

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### obj::lisp_set_field -> class/obj/lisp_set_field

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### obj::lisp_hash -> class/obj/lisp_hash

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## out

Super Class: stream

### out::vtable -> class/out/vtable

### out::create -> class/out/create

### out::init -> class/out/init

```lisp
inputs
r0 = out object (ptr)
r1 = vtable (pptr)
r2 = target mailbox id (id)
outputs
r0 = out object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### out::set_state -> class/out/set_state

```lisp
inputs
r0 = out object (ptr)
r1 = state (uint)
outputs
r0 = out object (ptr)
trashes
r1-r14
```

### out::wait_acks -> class/out/wait_acks

```lisp
inputs
r0 = out object (ptr)
r1 = msg ack num (uint)
outputs
r0 = out object (ptr)
trashes
r1-r14
```

### out::deinit -> class/out/deinit

```lisp
inputs
r0 = out object (ptr)
outputs
r0 = out object (ptr)
trashes
r1-r14
```

### out::write_flush -> class/out/write_flush

```lisp
inputs
r0 = out object (ptr)
outputs
r0 = out object (ptr)
trashes
r1-r14
```

### out::write_next -> class/out/write_next

```lisp
inputs
r0 = out object (ptr)
outputs
r0 = out object (ptr)
trashes
r1-r14
```

### out::lisp_create -> class/out/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## pair

Super Class: obj

### pair::vtable -> class/pair/vtable

### pair::create -> class/pair/create

### pair::init -> class/pair/init

```lisp
inputs
r0 = pair object (ptr)
r1 = vtable (pptr)
r2 = first object (ptr)
r3 = second object (ptr)
outputs
r0 = pair object (ptr)
r1 = 0 if error, else ok
trashes
r1
```

### pair::ref_first -> class/pair/ref_first

```lisp
inputs
r0 = pair object (ptr)
outputs
r0 = pair object (ptr)
r1 = object (ptr)
trashes
r1-r2
```

### pair::ref_second -> class/pair/ref_second

```lisp
inputs
r0 = pair object (ptr)
outputs
r0 = pair object (ptr)
r1 = object (ptr)
trashes
r1-r2
```

### pair::get_first -> class/pair/get_first

```lisp
inputs
r0 = pair object (ptr)
outputs
r0 = pair object (ptr)
r1 = object (ptr)
trashes
r1
```

### pair::get_second -> class/pair/get_second

```lisp
inputs
r0 = pair object (ptr)
outputs
r0 = pair object (ptr)
r1 = object (ptr)
trashes
r1
```

### pair::set_first -> class/pair/set_first

```lisp
inputs
r0 = pair object (ptr)
r1 = object (ptr)
outputs
r0 = pair object (ptr)
trashes
r1-r14
```

### pair::set_second -> class/pair/set_second

```lisp
inputs
r0 = pair object (ptr)
r1 = object (ptr)
outputs
r0 = pair object (ptr)
trashes
r1-r14
```

### pair::print -> class/pair/print

```lisp
inputs
r0 = pair object (ptr)
r1 = stream object (ptr)
outputs
r0 = pair object (ptr)
trashes
r1-r14
```

### pair::deinit -> class/pair/deinit

```lisp
inputs
r0 = pair object (ptr)
outputs
r0 = pair object (ptr)
trashes
r1-r14
```

## path

Super Class: fixeds

### path::vtable -> gui/path/vtable

### path::create -> gui/path/create

### path::vcreate -> gui/path/create

### path::filter_polyline -> gui/path/filter_polyline

```lisp
inputs
r0 = path object (ptr)
r1 = source path object, can be same (ptr)
r2 = tolerance (fixed)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::filter_polygon -> gui/path/filter_polygon

```lisp
inputs
r0 = path object (ptr)
r1 = source path object, can be same (ptr)
r2 = tolerance (fixed)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::transform -> gui/path/transform

```lisp
inputs
r0 = path object (ptr)
r1 = source path object, can be same (ptr)
r2 = m1x (fixed)
r3 = m1y (fixed)
r4 = m2x (fixed)
r5 = m2y (fixed)
r6 = trx (fixed)
r7 = try (fixed)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::simplify -> gui/path/simplify

```lisp
inputs
r0 = path object (ptr)
r1 = source path object (ptr)
r2 = stack array object (ptr)
r3 = tolerance (fixed)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::gen_clerp -> gui/path/gen_clerp

```lisp
inputs
r0 = path object (ptr)
r1 = stack array object (ptr)
r2 = cx (fixed)
r3 = cy (fixed)
r4 = v1x (fixed)
r5 = v1y (fixed)
r6 = v2x (fixed)
r7 = v2y (fixed)
r8 = radius (fixed)
r9 = tolerance (fixed)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::gen_arc -> gui/path/gen_arc

```lisp
inputs
r0 = path object (ptr)
r1 = stack array object (ptr)
r2 = cx (fixed)
r3 = cy (fixed)
r4 = start angle (fixed)
r5 = end angle (fixed)
r6 = radius (fixed)
r7 = tolerance (fixed)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::gen_quadratic -> gui/path/gen_quadratic

```lisp
inputs
r0 = path object (ptr)
r1 = stack array object (ptr)
r2 = p1x (fixed)
r3 = p1y (fixed)
r4 = p2x (fixed)
r5 = p2y (fixed)
r6 = p3x (fixed)
r7 = p3y (fixed)
r8 = tolerance (fixed)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::gen_cubic -> gui/path/gen_cubic

```lisp
inputs
r0 = path object (ptr)
r1 = stack array object (ptr)
r2 = p1x (fixed)
r3 = p1y (fixed)
r4 = p2x (fixed)
r5 = p2y (fixed)
r6 = p3x (fixed)
r7 = p3y (fixed)
r8 = p4x (fixed)
r9 = p4y (fixed)
r10 = tolerance (fixed)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::stroke_joints -> gui/path/stroke_joints

```lisp
inputs
r0 = path object (ptr)
r1 = stack array object (ptr)
r2 = in path start iter (plong)
r3 = in path end iter (plong)
r4 = p1x (fixed)
r5 = p1y (fixed)
r6 = p2x (fixed)
r7 = p2y (fixed)
r8 = radius (fixed)
r9 = tolerance (fixed)
r10 = join style (byte)
outputs
r0 = path object (ptr)
trashes
r1-r14
```

### path::stroke_polylines -> gui/path/stroke_polylines

```lisp
inputs
r0 = output list of path objects (ptr)
r1 = stack array object (ptr)
r2 = input list of path objects (ptr)
r3 = radius (fixed)
r4 = tolerance (fixed)
r5 = join style (byte)
r6 = cap style1 (byte)
r7 = cap style2 (byte)
outputs
r0 = output list of path objects (ptr)
trashes
r1-r14
```

### path::stroke_polygons -> gui/path/stroke_polygons

```lisp
inputs
r0 = output list of path objects (ptr)
r1 = stack array object (ptr)
r2 = input list of path objects (ptr)
r3 = radius (fixed)
r4 = tolerance (fixed)
r5 = join style (byte)
outputs
r0 = output list of path objects (ptr)
trashes
r1-r14
```

### path::lisp_transform -> gui/path/lisp_transform

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### path::lisp_simplify -> gui/path/lisp_simplify

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### path::lisp_filter -> gui/path/lisp_filter

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### path::lisp_gen_quadratic -> gui/path/lisp_gen_quadratic

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### path::lisp_gen_cubic -> gui/path/lisp_gen_cubic

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### path::lisp_gen_arc -> gui/path/lisp_gen_arc

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### path::lisp_stroke_polylines -> gui/path/lisp_stroke_polylines

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### path::lisp_stroke_polygons -> gui/path/lisp_stroke_polygons

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## progress

Super Class: view

### progress::vtable -> gui/progress/vtable

### progress::create -> gui/progress/create

### progress::pref_size -> gui/progress/pref_size

```lisp
inputs
r0 = progress object (ptr)
outputs
r0 = progress object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r9-r10
```

### progress::draw -> gui/progress/draw

```lisp
inputs
r0 = window object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = window object (ptr)
trashes
r1-r14
```

### progress::layout -> gui/backdrop/layout

```lisp
inputs
r0 = backdrop object (ptr)
outputs
r0 = backdrop object (ptr)
trashes
r1-r14
```

### progress::lisp_create -> gui/progress/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## real

Super Class: fixed

### real::vtable -> class/real/vtable

### real::create -> class/real/create

### real::print -> class/real/print

```lisp
inputs
r0 = real object (ptr)
r1 = stream object (ptr)
outputs
r0 = real object (ptr)
trashes
r1-r14
```

### real::vcreate -> class/real/create

### real::add -> class/real/add

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::sub -> class/real/sub

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::mul -> class/real/mul

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::div -> class/real/div

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = 0 if error, else result real object (ptr)
trashes
r1-r14
```

### real::mod -> class/real/mod

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = 0 if error, else result real object (ptr)
trashes
r1-r14
```

### real::min -> class/real/min

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::max -> class/real/max

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::abs -> class/real/abs

```lisp
inputs
r0 = real object (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::sign -> class/real/sign

```lisp
inputs
r0 = real object (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::neg -> class/real/neg

```lisp
inputs
r0 = real object (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::sqrt -> class/real/sqrt

```lisp
inputs
r0 = real object (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::frac -> class/real/frac

```lisp
inputs
r0 = real object (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::floor -> class/real/floor

```lisp
inputs
r0 = real object (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::recip -> class/real/recip

```lisp
inputs
r0 = real object (ptr)
outputs
r0 = real object (ptr)
r1 = result real object (ptr)
trashes
r1-r14
```

### real::lt -> class/real/lt

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### real::gt -> class/real/gt

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### real::le -> class/real/le

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

### real::ge -> class/real/ge

```lisp
inputs
r0 = real object (ptr)
r1 = list of real objects (ptr)
outputs
r0 = real object (ptr)
r1 = 0, -1 (int)
trashes
r1-r14
```

## reals

Super Class: fixeds

### reals::vtable -> class/reals/vtable

### reals::create -> class/reals/create

### reals::vcreate -> class/reals/create

### reals::velement -> class/real/create

### reals::add -> class/reals/add

```lisp
inputs
r0 = reals object (ptr)
r1 = source1 reals object, can be same (ptr)
r2 = source2 reals object, can be same (ptr)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

### reals::sub -> class/reals/sub

```lisp
inputs
r0 = reals object (ptr)
r1 = source1 reals object, can be same (ptr)
r2 = source2 reals object, can be same (ptr)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

### reals::mul -> class/reals/mul

```lisp
inputs
r0 = reals object (ptr)
r1 = source1 reals object, can be same (ptr)
r2 = source2 reals object, can be same (ptr)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

### reals::div -> class/reals/div

```lisp
inputs
r0 = reals object (ptr)
r1 = source1 reals object, can be same (ptr)
r2 = source2 reals object, can be same (ptr)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

### reals::mod -> class/reals/mod

```lisp
inputs
r0 = reals object (ptr)
r1 = source1 reals object, can be same (ptr)
r2 = source2 reals object, can be same (ptr)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

### reals::abs -> class/reals/abs

```lisp
inputs
r0 = reals object (ptr)
r1 = source reals object, can be same (ptr)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

### reals::sum -> class/reals/sum

```lisp
inputs
r0 = reals object (ptr)
outputs
r0 = reals object (ptr)
r1 = sum (real)
trashes
r1-r14
```

### reals::scale -> class/reals/scale

```lisp
inputs
r0 = reals object (ptr)
r1 = source reals object, can be same (ptr)
r2 = scale (real)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

### reals::frac -> class/reals/frac

```lisp
inputs
r0 = reals object (ptr)
r1 = source reals object, can be same (ptr)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

### reals::floor -> class/reals/floor

```lisp
inputs
r0 = reals object (ptr)
r1 = source reals object, can be same (ptr)
outputs
r0 = reals object (ptr)
trashes
r1-r14
```

## region

Super Class: null

### region::translate -> gui/region/translate

```lisp
inputs
r1 = region listhead (ptr)
r7 = x translation (pixels)
r8 = y translation (pixels)
trashes
r1, r11-r14
```

### region::bounds -> gui/region/bounds

```lisp
inputs
r1 = region listhead (ptr)
outputs
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
r10 = y1 (pixels)
trashes
r1, r7-r14
```

### region::clip_rect -> gui/region/clip_rect

```lisp
inputs
r0 = region heap (ptr)
r1 = source region listhead (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
r10 = y1 (pixels)
outputs
r0 = region heap (ptr)
trashes
r1-r3, r11-r14
```

### region::remove_rect -> gui/region/remove_rect

```lisp
inputs
r0 = region heap (ptr)
r1 = source region listhead (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
r10 = y1 (pixels)
outputs
r0 = region heap (ptr)
trashes
r1-r5, r11-r14
```

### region::cut_rect -> gui/region/cut_rect

```lisp
inputs
r0 = region heap (ptr)
r1 = source region listhead (ptr)
r2 = dest region listhead (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
r10 = y1 (pixels)
outputs
r0 = region heap (ptr)
trashes
r1-r6, r11-r14
```

### region::copy_rect -> gui/region/copy_rect

```lisp
inputs
r0 = region heap (ptr)
r1 = source region listhead (ptr)
r2 = dest region listhead (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
r10 = y1 (pixels)
outputs
r0 = region heap (ptr)
trashes
r1-r4, r11-r14
```

### region::paste_rect -> gui/region/paste_rect

```lisp
inputs
r0 = region heap (ptr)
r1 = dest region listhead (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = x1 (pixels)
r10 = y1 (pixels)
outputs
r0 = region heap (ptr)
trashes
r1-r14
```

### region::free -> gui/region/free

```lisp
inputs
r0 = region heap (ptr)
r1 = source region listhead (ptr)
outputs
r0 = region heap (ptr)
trashes
r1-r3
```

### region::copy_region -> gui/region/copy_region

```lisp
inputs
r0 = region heap (ptr)
r1 = source region listhead (ptr)
r2 = dest region listhead (ptr)
r3 = copy region listhead (ptr)
r7 = x translation (pixels)
r8 = y translation (pixels)
outputs
r0 = region heap (ptr)
trashes
r1-r14
```

### region::paste_region -> gui/region/paste_region

```lisp
inputs
r0 = region heap (ptr)
r1 = source region listhead (ptr)
r2 = dest region listhead (ptr)
r7 = x translation (pixels)
r8 = y translation (pixels)
outputs
r0 = region heap (ptr)
trashes
r1-r14
```

### region::remove_region -> gui/region/remove_region

```lisp
inputs
r0 = region heap (ptr)
r1 = source region listhead (ptr)
r2 = dest region listhead (ptr)
r7 = x translation (pixels)
r8 = y translation (pixels)
outputs
r0 = region heap (ptr)
trashes
r1-r14
```

## scroll

Super Class: view

### scroll::vtable -> gui/scroll/vtable

### scroll::create -> gui/scroll/create

### scroll::init -> gui/scroll/init

```lisp
inputs
r0 = scroll object (ptr)
r1 = vtable (pptr)
r2 = options flags (ulong)
outputs
r0 = scroll object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### scroll::add_child -> gui/scroll/add_child

```lisp
inputs
r0 = scroll object (ptr)
r1 = child view object (ptr)
outputs
r0 = scroll object (ptr)
trashes
r1-r14
```

### scroll::layout -> gui/scroll/layout

```lisp
inputs
r0 = scroll object (ptr)
outputs
r0 = scroll object (ptr)
trashes
r1-r14
```

### scroll::pref_size -> gui/scroll/pref_size

```lisp
inputs
r0 = scroll object (ptr)
outputs
r0 = scroll object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### scroll::action -> gui/scroll/action

```lisp
inputs
r0 = scroll object (ptr)
r1 = event data (ptr)
outputs
r0 = scroll object (ptr)
trashes
r1-r14
```

### scroll::lisp_create -> gui/scroll/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## seq

Super Class: obj

### seq::vtable -> class/seq/vtable

### seq::get_length -> class/obj/null

### seq::ref_element -> class/obj/null

### seq::slice -> class/obj/null

### seq::cat -> class/obj/null

### seq::find -> class/obj/null

### seq::rfind -> class/obj/null

### seq::lisp_length -> class/seq/lisp_length

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### seq::lisp_elem -> class/seq/lisp_elem

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### seq::lisp_find -> class/seq/lisp_find

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### seq::lisp_rfind -> class/seq/lisp_rfind

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### seq::lisp_slice -> class/seq/lisp_slice

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### seq::lisp_cat -> class/seq/lisp_cat

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### seq::lisp_each -> class/seq/lisp_each

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### seq::lisp_some -> class/seq/lisp_some

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## slider

Super Class: view

### slider::vtable -> gui/slider/vtable

### slider::create -> gui/slider/create

### slider::init -> gui/slider/init

```lisp
inputs
r0 = slider object (ptr)
r1 = vtable (pptr)
outputs
r0 = slider object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### slider::pref_size -> gui/slider/pref_size

```lisp
inputs
r0 = slider object (ptr)
outputs
r0 = slider object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r9-r10
```

### slider::draw -> gui/slider/draw

```lisp
inputs
r0 = window object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = window object (ptr)
trashes
r1-r14
```

### slider::layout -> gui/backdrop/layout

```lisp
inputs
r0 = backdrop object (ptr)
outputs
r0 = backdrop object (ptr)
trashes
r1-r14
```

### slider::mouse_down -> gui/slider/mouse_down

```lisp
inputs
r0 = slider object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = slider object (ptr)
trashes
r1-r14
```

### slider::mouse_up -> gui/slider/mouse_up

```lisp
inputs
r0 = slider object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = slider object (ptr)
trashes
r1-r14
```

### slider::mouse_move -> gui/slider/mouse_move

```lisp
inputs
r0 = slider object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = slider object (ptr)
trashes
r1-r14
```

### slider::lisp_create -> gui/slider/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## sstream

Super Class: stream

### sstream::vtable -> class/sstream/vtable

### sstream::create -> class/sstream/create

### sstream::init -> class/sstream/init

```lisp
inputs
r0 = sstream object (ptr)
r1 = vtable (pptr)
r2 = str object (ptr)
outputs
r0 = sstream object (ptr)
r1 = 0 if error, else ok
trashes
r1-r5
```

### sstream::ref_string -> class/sstream/ref_string

```lisp
inputs
r0 = sstream object (ptr)
outputs
r0 = sstream object (ptr)
r1 = str object (ptr)
trashes
r1-r2
```

### sstream::write_next -> class/sstream/write_next

```lisp
inputs
r0 = sstream object (ptr)
outputs
r0 = sstream object (ptr)
trashes
r1-r14
```

### sstream::write_flush -> class/sstream/write_flush

```lisp
inputs
r0 = sstream object (ptr)
outputs
r0 = sstream object (ptr)
trashes
r1-r14
```

## stdio

Super Class: obj

### stdio::vtable -> class/stdio/vtable

### stdio::create -> class/stdio/create

### stdio::init -> class/stdio/init

```lisp
inputs
r0 = stdio object (ptr)
r1 = vtable (pptr)
outputs
r0 = stdio object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### stdio::deinit -> class/stdio/deinit

```lisp
inputs
r0 = stdio object (ptr)
outputs
r0 = stdio object (ptr)
trashes
r1-r14
```

### stdio::lisp_create -> class/stdio/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## str

Super Class: seq

### str::vtable -> class/str/vtable

### str::create_from_buffer -> class/str/create_from_buffer

```lisp
inputs
r0 = buffer (pubyte)
r1 = buffer length (uint)
outputs
r0 = 0 if error, else str object (ptr)
trashes
r1-r6
```

### str::create_from_cstr -> class/str/create_from_cstr

```lisp
inputs
r0 = c string (pubyte)
outputs
r0 = 0 if error, else str object (ptr)
trashes
r1-r6
```

### str::create_from_file -> class/str/create_from_file

```lisp
inputs
r0 = file name c string (pubyte)
outputs
r0 = 0 if error, else str object (ptr)
trashes
r1-r6
```

### str::create_from_long -> class/str/create_from_long

```lisp
inputs
r0 = number (long)
r1 = base, - for unsigned, (long)
outputs
r0 = 0 if error, else str object (ptr)
trashes
r1-r6
```

### str::append -> class/str/append

```lisp
inputs
r0 = str object (ptr)
r1 = str object (ptr)
outputs
r0 = 0 if error, else new str object (ptr)
trashes
r1-r6
```

### str::init -> class/str/init

```lisp
inputs
r0 = str object (ptr)
r1 = vtable (pptr)
r2 = 0 else, buffer (pubyte)
r3 = buffer length (uint)
outputs
r0 = str object (ptr)
r1 = 0 if error, else ok
trashes
r1-r6
```

### str::init1 -> class/str/init1

```lisp
inputs
r0 = str object (ptr)
r1 = vtable (pptr)
r2 = str object (ptr)
r3 = str object (ptr)
outputs
r0 = str object (ptr)
r1 = 0 if error, else ok
trashes
r1-r6
```

### str::init2 -> class/str/init2

```lisp
inputs
r0 = str object (ptr)
r1 = vtable (pptr)
r2 = file name c string (pubyte)
r3 = file length (uint)
outputs
r0 = str object (ptr)
r1 = 0 if error, else ok
trashes
r1-r6
```

### str::init3 -> class/str/init3

```lisp
inputs
r0 = str object (ptr)
r1 = vtable (pptr)
r2 = list of str objects (ptr)
outputs
r0 = str object (ptr)
r1 = 0 if error, else ok
trashes
r1-r6
```

### str::split -> class/str/split

```lisp
inputs
r0 = str object (ptr)
r1 = split chars str object (ptr)
outputs
r0 = str object (ptr)
r1 = list of str objects (ptr)
trashes
r1-r14
```

### str::split_char -> class/str/split_char

```lisp
inputs
r0 = str object (ptr)
r1 = split char (uint)
outputs
r0 = str object (ptr)
r1 = list of str objects (ptr)
trashes
r1-r14
```

### str::compare -> class/str/compare

```lisp
inputs
r0 = str object (ptr)
r1 = str object (ptr)
outputs
r0 = str object (ptr)
r1 = 0 if same, else -, +
trashes
r1-r7
```

### str::starts_with -> class/str/starts_with

```lisp
inputs
r0 = str prefix object (ptr)
r1 = str object (ptr)
outputs
r0 = str prefix object (ptr)
r1 = 0 if match
trashes
r1-r6
```

### str::same -> class/str/same

```lisp
inputs
r0 = str object (ptr)
r1 = str object (ptr)
outputs
r0 = str object (ptr)
r1 = 0 if same
trashes
r1-r6
```

### str::print -> class/str/print

```lisp
inputs
r0 = str object (ptr)
r1 = stream object (ptr)
outputs
r0 = str object (ptr)
trashes
r1-r14
```

### str::hash -> class/str/hash

```lisp
inputs
r0 = str object (ptr)
outputs
r0 = str object (ptr)
r1 = hash code (ulong)
trashes
r1-r4
```

### str::get_length -> class/str/get_length

```lisp
inputs
r0 = str object (ptr)
outputs
r0 = str object (ptr)
r1 = string length (bytes)
trashes
r1
```

### str::ref_element -> class/str/ref_element

```lisp
inputs
r0 = str object (ptr)
r1 = char index (uint)
outputs
r0 = str object (ptr)
r1 = char str object (ptr)
trashes
r1-r7
```

### str::slice -> class/str/slice

```lisp
inputs
r0 = str object (ptr)
r1 = element start index (uint)
r2 = element end index (uint)
outputs
r0 = str object (ptr)
r1 = string slice object (ptr)
trashes
r1-r7
```

### str::cat -> class/str/cat

```lisp
inputs
r0 = str object (ptr)
r1 = list of str objects (ptr)
outputs
r0 = 0 if error, else new str object (ptr)
trashes
r1-r6
```

### str::find -> class/str/find

```lisp
inputs
r0 = str object (ptr)
r1 = search char (uint)
outputs
r0 = str object (ptr)
r1 = search char (uint)
r2 = -1, else position (int)
trashes
r2-r5
```

### str::rfind -> class/str/rfind

```lisp
inputs
r0 = str object (ptr)
r1 = search char (uint)
outputs
r0 = str object (ptr)
r1 = search char (uint)
r2 = -1, else position (int)
trashes
r2-r4
```

### str::lisp_str -> class/str/lisp_str

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### str::lisp_split -> class/str/lisp_split

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### str::lisp_code -> class/str/lisp_code

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### str::lisp_char -> class/str/lisp_char

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### str::lisp_cmp -> class/str/lisp_cmp

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### str::lisp_save -> class/str/lisp_save

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### str::lisp_load -> class/str/lisp_load

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## stream

Super Class: obj

### stream::vtable -> class/stream/vtable

### stream::create -> class/stream/create

### stream::init -> class/stream/init

```lisp
inputs
r0 = stream object (ptr)
r1 = vtable (pptr)
r2 = buffer object, 0 if none (ptr)
r3 = buffer data, 0 if none (ptr)
r4 = buffer start (pubyte)
r5 = buffer length (uint)
outputs
r0 = stream object (ptr)
r1 = 0 if error, else ok
trashes
r1-r5
```

### stream::available -> class/stream/available

```lisp
inputs
r0 = stream object (ptr)
outputs
r0 = stream object (ptr)
r1 = available space (bytes)
trashes
r1-r2
```

### stream::read_bits -> class/stream/read_bits

```lisp
inputs
r0 = stream object (ptr)
r1 = num bits (uint)
r2 = bit pool (ulong)
r3 = bit pool size (uint)
outputs
r0 = stream object (ptr)
r1 = -1 if eof, else data (long)
r2 = bit pool (ulong)
r3 = bit pool size (uint)
trashes
r1-r14
```

### stream::write_bits -> class/stream/write_bits

```lisp
inputs
r0 = stream object (ptr)
r1 = data (uint)
r2 = num bits (uint)
r3 = bit pool (ulong)
r4 = bit pool size (uint)
outputs
r0 = stream object (ptr)
r1 = bit pool (ulong)
r2 = bit pool size (uint)
trashes
r1-r14
```

### stream::read_char -> class/stream/read_char

```lisp
inputs
r0 = stream object (ptr)
outputs
r0 = stream object (ptr)
r1 = -1 for EOF, else char read (int)
trashes
r1-r14
```

### stream::read_line -> class/stream/read_line

```lisp
inputs
r0 = stream object (ptr)
outputs
r0 = stream object (ptr)
r1 = 0 for EOF, else str object (ptr)
trashes
r1-r14
```

### stream::read -> class/stream/read

```lisp
inputs
r0 = stream object (ptr)
r1 = buffer (pubyte)
r2 = buffer length (uint)
outputs
r0 = stream object (ptr)
r1 = -1 for EOF, else bytes read (int)
trashes
r1-r14
```

### stream::write_char -> class/stream/write_char

```lisp
inputs
r0 = stream object (ptr)
r1 = char (uint)
outputs
r0 = stream object (ptr)
trashes
r1-r14
```

### stream::write -> class/stream/write

```lisp
inputs
r0 = stream object (ptr)
r1 = buffer (pubyte)
r2 = buffer length (uint)
outputs
r0 = stream object (ptr)
trashes
r1-r14
```

### stream::write_cstr -> class/stream/write_cstr

```lisp
inputs
r0 = stream object (ptr)
r1 = buffer (pubyte)
outputs
r0 = stream object (ptr)
trashes
r1-r14
```

### stream::skip -> class/stream/skip

```lisp
inputs
r0 = stream object (ptr)
r1 = char to skip (uint)
outputs
r0 = stream object (ptr)
trashes
r1-r14
```

### stream::skip_not -> class/stream/skip_not

```lisp
inputs
r0 = stream object (ptr)
r1 = char to not skip (uint)
outputs
r0 = stream object (ptr)
trashes
r1-r14
```

### stream::deinit -> class/stream/deinit

```lisp
inputs
r0 = stream object (ptr)
outputs
r0 = stream object (ptr)
trashes
r1-r14
```

### stream::read_next -> class/stream/read_next

```lisp
inputs
r0 = stream object (ptr)
outputs
r0 = stream object (ptr)
r1 = -1 for EOF, else more data
trashes
r1-r14
```

### stream::write_next -> class/stream/write_flush

```lisp
inputs
r0 = stream object (ptr)
outputs
r0 = stream object (ptr)
trashes
r1-r14
```

### stream::write_flush -> class/stream/write_flush

```lisp
inputs
r0 = stream object (ptr)
outputs
r0 = stream object (ptr)
trashes
r1-r14
```

### stream::lisp_iostream -> class/stream/lisp_iostream

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_sstream -> class/stream/lisp_sstream

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_fstream -> class/stream/lisp_fstream

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_available -> class/stream/lisp_available

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_readchar -> class/stream/lisp_readchar

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_readline -> class/stream/lisp_readline

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_readavail -> class/stream/lisp_readavail

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_writechar -> class/stream/lisp_writechar

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_write -> class/stream/lisp_write

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_write_flush -> class/stream/lisp_write_flush

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### stream::lisp_write_next -> class/stream/lisp_write_next

## sym

Super Class: str

### sym::vtable -> class/sym/vtable

### sym::statics -> class/sym/statics

```lisp
info
symbol static data
```

### sym::statics_init -> class/sym/statics_init

```lisp
trashes
r0-r14
```

### sym::get_static_sym -> class/sym/get_static_sym

```lisp
inputs
r1 = static sym num (uint)
outputs
r1 = sym object (ptr)
trashes
r1, r3
```

### sym::flush -> class/sym/flush

```lisp
trashes
r0-r14
```

### sym::intern -> class/sym/intern

```lisp
inputs
r0 = sym object (ptr)
outputs
r0 = interned sym object (ptr)
trashes
r0-r14
info
input sym IS derefed
vtable MUST be a sym
```

### sym::intern_str -> class/sym/intern_str

```lisp
inputs
r0 = str object (ptr)
outputs
r0 = interned sym object (ptr)
trashes
r0-r14
info
input str IS NOT derefed
```

### sym::intern_cstr -> class/sym/intern_cstr

```lisp
inputs
r0 = c string pointer (pubyte)
outputs
r0 = interned sym object (ptr)
trashes
r0-r14
```

### sym::intern_strs -> class/sym/intern_strs

```lisp
inputs
r1 = list of string objects (ptr)
outputs
r1 = list of sym objects (ptr)
trashes
r0-r14
```

### sym::print -> class/sym/print

```lisp
inputs
r0 = sym object (ptr)
r1 = stream object (ptr)
outputs
r0 = sym object (ptr)
trashes
r1-r14
```

### sym::lisp_sym -> class/sym/lisp_sym

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sym::lisp_gensym -> class/sym/lisp_gensym

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## sys_heap

Super Class: null

### sys_heap::init -> sys/heap/init

```lisp
inputs
r0 = heap (ptr)
r1 = cell size (bytes)
r2 = num cells (uint)
outputs
r0 = heap (ptr)
r1 = cell size (bytes)
trashes
r1-r2
```

### sys_heap::deinit -> sys/heap/deinit

```lisp
inputs
r0 = heap (ptr)
outputs
r0 = heap (ptr)
trashes
r1-r5
```

### sys_heap::alloc -> sys/heap/alloc

```lisp
inputs
r0 = heap (ptr)
outputs
r0 = heap (ptr)
r1 = cell (ptr)
trashes
r1-r2
```

### sys_heap::free -> sys/heap/free

```lisp
inputs
r0 = heap (ptr)
r1 = cell (ptr)
outputs
r0 = heap (ptr)
r1 = cell (ptr)
trashes
r2
```

### sys_heap::collect -> sys/heap/collect

```lisp
inputs
r0 = heap (ptr)
outputs
r0 = heap (ptr)
trashes
r1-r11
```

## sys_kernel

Super Class: null

### sys_kernel::id -> sys/kernel/id

```lisp
outputs
r0 = cpu ID (uint)
trashes
r0
```

### sys_kernel::kernel -> sys/kernel/kernel

```lisp
inputs
r0 = argv pointer (pptr)
info
loader is already initialized when we get here !
```

## sys_link

Super Class: null

### sys_link::init -> sys/link/init

### sys_link::link -> sys/link/link

```lisp
started by kernel for each link
```

## sys_list

Super Class: null

### sys_list::init -> sys/list/init

```lisp
inputs
r0 = list header (ptr)
```

## sys_load

Super Class: null

### sys_load::statics -> sys/load/statics

### sys_load::init -> sys/load/init

```lisp
inputs
system argv
host function table
info
register inputs are dependant on the platform ABI
they are extracted via (abi-arg 0) and (abi-arg 1)
```

### sys_load::bind -> sys/load/bind

```lisp
input
r0 = c string function path name (pubyte)
output
r0 = 0 else, function entry pointer (ptr)
trashes
r1-r7
```

## sys_mail

Super Class: null

### sys_mail::statics -> sys/mail/statics

```lisp
info
mail static data
```

### sys_mail::statics_init -> sys/mail/statics_init

```lisp
info
init the mailbox system, heap, buckets and id
```

### sys_mail::statics_init1 -> sys/mail/statics_init1

```lisp
info
init the mail system
```

### sys_mail::alloc_mbox -> sys/mail/alloc_mbox

```lisp
outputs
r0 = mailbox id (uint)
r1 = mailbox address (ptr)
trashes
r0-r5
```

### sys_mail::free_mbox -> sys/mail/free_mbox

```lisp
inputs
r0 = mailbox id (uint)
trashes
r0-r4
```

### sys_mail::validate -> sys/mail/validate

```lisp
inputs
r0 = mailbox id (uint)
outputs
r0 = 0, else mailbox address (ptr)
trashes
r0-r3
```

### sys_mail::alloc -> sys/mail/alloc

```lisp
inputs
r0 = mail size (bytes)
outputs
r0 = mail message (ptr)
r1 = string data (pubyte)
trashes
r0-r4
```

### sys_mail::free -> sys/mail/free

```lisp
inputs
r0 = mail message (ptr)
trashes
r0-r14
```

### sys_mail::alloc_obj -> sys/mail/alloc_obj

```lisp
inputs
r0 = object (ptr)
r1 = data (pubyte)
r2 = data length (bytes)
outputs
r0 = mail message (ptr)
trashes
r0-r5
```

### sys_mail::free_obj -> sys/mail/free_obj

```lisp
inputs
r0 = mail message (ptr)
outputs
r0 = 0 if msg was 0, else object (ptr)
r1 = data (pubyte)
r2 = data length (bytes)
trashes
r0-r5
```

### sys_mail::send -> sys/mail/send

```lisp
inputs
r0 = mail message (ptr)
trashes
r0-r4
```

### sys_mail::read -> sys/mail/read

```lisp
inputs
r0 = mailbox address (ptr)
outputs
r0 = mail address (ptr)
r1 = string data (pubyte)
trashes
r0-r2
```

### sys_mail::poll -> sys/mail/poll

```lisp
inputs
r0 = mailbox id array object (ptr)
outputs
r0 = -1, else mailbox index (uint)
r4 = mailbox id array begin iter (pptr)
r5 = mailbox id array end iter (pptr)
trashes
r0-r6
```

### sys_mail::select -> sys/mail/select

```lisp
inputs
r0 = mailbox id array object (ptr)
outputs
r0 = mailbox index (uint)
trashes
r0-r8
```

### sys_mail::mymail -> sys/mail/mymail

```lisp
outputs
r0 = mail address (ptr)
r1 = string data (pubyte)
trashes
r0-r2
```

### sys_mail::service -> sys/mail/service

```lisp
inputs
r0 = service name str object (ptr)
r1 = mailbox id num object (ptr)
r2 = service info str object (ptr)
outputs
r0 = service entry str object (ptr)
trashes
r0-r14
```

### sys_mail::ping -> sys/mail/ping

```lisp
trashes
r0-r14
info
ping services out to network
```

### sys_mail::declare -> sys/mail/declare

```lisp
inputs
r0 = service name str object (ptr)
r1 = mailbox id num object (ptr)
r2 = service info str object (ptr)
outputs
r0 = service key str object (ptr)
trashes
r0-r14
```

### sys_mail::forget -> sys/mail/forget

```lisp
inputs
r0 = service key str object (ptr)
trashes
r0-r14
```

### sys_mail::enquire -> sys/mail/enquire

```lisp
inputs
r0 = service prefix str object (ptr)
outputs
r0 = matching service entries list object (ptr)
trashes
r0-r14
```

### sys_mail::devices -> sys/mail/devices

```lisp
outputs
r0 = known device cpu array object (ptr)
trashes
r0-r14
```

### sys_mail::junk_mail -> sys/mail/junk_mail

```lisp
inputs
r3 = mail list pointer (ptr)
trashes
r0-r4
```

### sys_mail::in -> sys/mail/in

```lisp
inputs
r0 = link input msg buffer (ptr)
trashes
r0-r14
```

### sys_mail::out -> sys/mail/out

```lisp
info
parcels going off chip or junk mail task
```

### sys_mail::lisp_read -> sys/mail/lisp_read

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_poll -> sys/mail/lisp_poll

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_select -> sys/mail/lisp_select

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_send -> sys/mail/lisp_send

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_declare -> sys/mail/lisp_declare

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_enquire -> sys/mail/lisp_enquire

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_forget -> sys/mail/lisp_forget

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_devices -> sys/mail/lisp_devices

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_alloc_mbox -> sys/mail/lisp_alloc_mbox

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_mail::lisp_free_mbox -> sys/mail/lisp_free_mbox

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## sys_math

Super Class: null

### sys_math::i_rand -> sys/math/i_rand

```lisp
inputs
r0 = random range (ulong)
outputs
r0 = random number in range (ulong)
trashes
r0-r2
```

### sys_math::i_sqrt -> sys/math/i_sqrt

```lisp
inputs
r0 = number (ulong)
outputs
r0 = sqrt (ulong)
trashes
r0-r3
```

### sys_math::f_sqrt -> sys/math/f_sqrt

```lisp
inputs
r0 = number (fixed)
outputs
r0 = sqrt (fixed)
trashes
r0-r3
```

### sys_math::f_sin -> sys/math/f_sin

```lisp
inputs
r0 = angle in radians (fixed)
outputs
r0 = sine (fixed)
trashes
r0-r4
```

### sys_math::f_cos -> sys/math/f_cos

```lisp
inputs
r0 = angle in radians (fixed)
outputs
r0 = cosine (fixed)
trashes
r0-r4
```

### sys_math::f_intersect -> sys/math/f_intersect

```lisp
inputs
r0 = p1x (fixed)
r1 = p1y (fixed)
r2 = p2x (fixed)
r3 = p2y (fixed)
r4 = v1x (fixed)
r5 = v1y (fixed)
r6 = v2x (fixed)
r7 = v2y (fixed)
outputs
r0 = ix (fixed)
r1 = iy (fixed)
trashes
r0-r14
```

### sys_math::f_dist_sqd -> sys/math/f_dist_sqd

```lisp
inputs
r0 = px (fixed)
r1 = py (fixed)
r2 = p1x (fixed)
r3 = p1y (fixed)
r4 = p2x (fixed)
r5 = p2y (fixed)
outputs
r0 = distance squared (fixed)
trashes
r0-r14
```

### sys_math::r_pack -> sys/math/r_pack

```lisp
inputs
r13 = exponent (long)
r14 = mantisa (long)
outputs
r13 = real (32:32)
trashes
r12-r14
```

### sys_math::r_add -> sys/math/r_add

```lisp
inputs
r13 = real (32:32)
r14 = real (32:32)
outputs
r13 = real (32:32)
trashes
r11-r14
```

### sys_math::r_sub -> sys/math/r_sub

```lisp
inputs
r13 = real (32:32)
r14 = real (32:32)
outputs
r13 = real (32:32)
trashes
r11-r14
```

### sys_math::r_mul -> sys/math/r_mul

```lisp
inputs
r13 = real (32:32)
r14 = real (32:32)
outputs
r13 = real (32:32)
trashes
r11-r14
```

### sys_math::r_div -> sys/math/r_div

```lisp
inputs
r13 = real (32:32)
r14 = real (32:32)
outputs
r13 = real (32:32)
trashes
r11-r14
```

### sys_math::r_mod -> sys/math/r_mod

```lisp
inputs
r13 = real (32:32)
r14 = real (32:32)
outputs
r13 = real (32:32)
trashes
r9-r14
```

### sys_math::r_frac -> sys/math/r_frac

```lisp
inputs
r13 = real (32:32)
outputs
r13 = real (32:32)
trashes
r10-r14
```

### sys_math::r_floor -> sys/math/r_floor

```lisp
inputs
r13 = real (32:32)
outputs
r13 = real (32:32)
trashes
r12-r14
```

### sys_math::r_i2r -> sys/math/r_i2r

```lisp
inputs
r14 = num (long)
outputs
r13 = real (32:32)
trashes
r12-r14
```

### sys_math::r_f2r -> sys/math/r_f2r

```lisp
inputs
r14 = num (fixed)
outputs
r13 = real (32:32)
trashes
r12-r14
```

### sys_math::r_r2i -> sys/math/r_r2i

```lisp
inputs
r13 = real (32:32)
outputs
r14 = num (long)
trashes
r12-r14
```

### sys_math::r_r2f -> sys/math/r_r2f

```lisp
inputs
r13 = real (32:32)
outputs
r14 = num (fixed)
trashes
r12-r14
```

## sys_mem

Super Class: null

### sys_mem::statics -> sys/mem/statics

```lisp
info
mem statics data
```

### sys_mem::statics_init -> sys/mem/statics_init

```lisp
info
init mem statics
```

### sys_mem::statics_deinit -> sys/mem/statics_deinit

```lisp
info
deinit mem statics
```

### sys_mem::alloc -> sys/mem/alloc

```lisp
inputs
r0 = minimum amount (bytes)
outputs
r0 = 0 if failed, else address (ptr)
r1 = 0 if failed, else size given (bytes)
trashes
r0-r2
```

### sys_mem::calloc -> sys/mem/calloc

```lisp
inputs
r0 = minimum amount (bytes)
outputs
r0 = 0 if failed, else address (ptr)
r1 = 0 if failed, else size given (bytes)
trashes
r0-r2
```

### sys_mem::free -> sys/mem/free

```lisp
inputs
r0 = address (ptr)
trashes
r0-r2
```

### sys_mem::fill -> sys/mem/fill

```lisp
inputs
r0 = address (ptr)
r1 = length (bytes)
r2 = fill pattern (ulong)
outputs
r0 = address end (ptr)
trashes
r0-r3
```

### sys_mem::copy -> sys/mem/copy

```lisp
inputs
r0 = source address (ptr)
r1 = destination address (ptr)
r2 = length (bytes)
outputs
r0 = source address end (ptr)
r1 = destination address end (ptr)
trashes
r0-r3
```

### sys_mem::realloc -> sys/mem/realloc

```lisp
inputs
r0 = block address (ptr)
r1 = block size (bytes)
r2 = new block min size (bytes)
outputs
r0 = new block address (ptr)
r1 = new block size (bytes)
trashes
r0-r5
```

### sys_mem::recalloc -> sys/mem/recalloc

```lisp
inputs
r0 = block address (ptr)
r1 = block size (bytes)
r2 = new block min size (bytes)
outputs
r0 = new block address (ptr)
r1 = new block size (bytes)
trashes
r0-r7
```

### sys_mem::collect -> sys/mem/collect

```lisp
trashes
r0-r14
info
free all unused blocks
```

### sys_mem::used -> sys/mem/used

```lisp
outputs
r0 = amount (bytes)
trashes
r0
```

### sys_mem::lisp_stats -> sys/mem/lisp_stats

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## sys_pii

Super Class: null

### sys_pii::exit -> sys/pii/exit

```lisp
inputs
r0 = code (long)
```

### sys_pii::mmap -> sys/pii/mmap

```lisp
inputs
r0 = len (ulong)
r1 = fd (ulong)
r2 = mode (ulong)
outputs
r0 = buffer (ptr)
trashes
r0
```

### sys_pii::munmap -> sys/pii/munmap

```lisp
inputs
r0 = buffer (ptr)
r1 = len (ulong)
r2 = mode (ulong)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::mprotect -> sys/pii/mprotect

```lisp
inputs
r0 = buffer (ptr)
r1 = len (ulong)
r2 = prot (ulong)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::open -> sys/pii/open

```lisp
inputs
r0 = c string filename (pubyte)
r1 = mode (ulong)
outputs
r0 = fd (ulong)
trashes
r0
```

### sys_pii::close -> sys/pii/close

```lisp
inputs
r0 = fd (ulong)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::open_shared -> sys/pii/open_shared

```lisp
inputs
r0 = c string filename (pubyte)
r1 = length (ulong)
outputs
r0 = handle (long)
trashes
r0
```

### sys_pii::close_shared -> sys/pii/close_shared

```lisp
inputs
r0 = c string filename (pubyte)
r1 = handle (long)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::unlink -> sys/pii/unlink

```lisp
inputs
r0 = c string filename (pubyte)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::stat -> sys/pii/stat

```lisp
inputs
r0 = c string filename (pubyte)
r1 = stat buf (ptr)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::write -> sys/pii/write

```lisp
inputs
r0 = fd (ulong)
r1 = buffer (pubyte)
r2 = len (ulong)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::write_char -> sys/pii/write_char

```lisp
inputs
r0 = fd (ulong)
r1 = char (ulong)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::write_str -> sys/pii/write_str

```lisp
inputs
r0 = fd (ulong)
r1 = c string (pubyte)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::write_num -> sys/pii/write_num

```lisp
inputs
r0 = fd (ulong)
r1 = number (ulong)
r2 = base (ulong)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::read -> sys/pii/read

```lisp
inputs
r0 = fd (ulong)
r1 = buffer (ptr)
r2 = len (ulong)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::read_char -> sys/pii/read_char

```lisp
inputs
r0 = fd (ulong)
outputs
r0 = char (ulong)
trashes
r0
```

### sys_pii::time -> sys/pii/time

```lisp
outputs
r0 = time in usec (ulong)
trashes
r0
```

### sys_pii::clear_icache -> sys/pii/clear_icache

```lisp
inputs
r0 = address (pubyte)
r1 = length (ulong)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::dirlist -> sys/pii/dirlist

```lisp
inputs
r0 = c string pathname (pubyte)
r1 = buffer pointer (ptr)
r2 = buffer length (ulong)
outputs
r0 = buffer length (ulong)
trashes
r0
```

### sys_pii::remove -> sys/pii/remove

```lisp
inputs
r0 = c string filename (pubyte)
outputs
r0 = error code (ulong)
trashes
r0
```

### sys_pii::lisp_readchar -> sys/pii/lisp_readchar

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_pii::lisp_writechar -> sys/pii/lisp_writechar

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_pii::lisp_time -> sys/pii/lisp_time

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_pii::lisp_age -> sys/pii/lisp_age

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_pii::lisp_dirlist -> sys/pii/lisp_dirlist

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_pii::lisp_remove -> sys/pii/lisp_remove

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## sys_str

Super Class: null

### sys_str::length -> sys/str/length

```lisp
inputs
r0 = c string (pubyte)
outputs
r0 = c string (pubyte)
r1 = c string len (bytes)
trashes
r1-r2
```

### sys_str::copy -> sys/str/copy

```lisp
inputs
r0 = c string (pubyte)
r1 = c string copy (pubyte)
outputs
r0 = c string end (pubyte)
r1 = c string copy end (pubyte)
trashes
r2
```

### sys_str::compare -> sys/str/compare

```lisp
inputs
r0 = c string1 (pubyte)
r1 = c string2 (pubyte)
outputs
r0 = 0 if same, else -, +
trashes
r0-r3
```

### sys_str::to_long -> sys/str/to_long

```lisp
inputs
r0 = c string (pubyte)
r1 = base (ulong)
outputs
r0 = number (ulong)
r4 = fixed point position (uint)
trashes
r0-r4
```

### sys_str::from_long -> sys/str/from_long

```lisp
inputs
r0 = number (ulong)
r1 = c string buffer (pubyte)
r2 = base (ulong)
outputs
r0 = c string buffer end (pubyte)
trashes
r0-r4
```

### sys_str::read_utf8 -> sys/str/read_utf8

```lisp
inputs
r0 = utf8 data pointer (pubyte)
outputs
r0 = utf8 data pointer (pubyte)
r1 = utf8 char (uint)
trashes
r0-r2
```

## sys_task

Super Class: null

### sys_task::statics -> sys/task/statics

```lisp
info
task statics data
```

### sys_task::statics_init -> sys/task/statics_init

```lisp
info
init task statics
```

### sys_task::tcb -> sys/task/tcb

```lisp
outputs
r0 = current task tcb (ptr)
trashes
r0
```

### sys_task::mailbox -> sys/task/mailbox

```lisp
outputs
r0 = current task mailbox id (id)
trashes
r0
```

### sys_task::callback -> sys/task/callback

```lisp
inputs
r0 = user data address (ptr)
r1 = callback address (ptr)
trashes
r0-r14
```

### sys_task::start -> sys/task/start

```lisp
inputs
r0 = new task func pointer (ptr)
outputs
r0 = new task control block (ptr)
r1 = new task mailbox id (id)
r2 = new task mailbox address (ptr)
trashes
r0-r14
```

### sys_task::stop -> sys/task/stop

```lisp
info
stop current task, switch to next task
```

### sys_task::restore -> sys/task/restore

```lisp
trashes
r0-r14
info
restore next ready task
```

### sys_task::count -> sys/task/count

```lisp
outputs
r0 = task count (uint)
trashes
r0
```

### sys_task::sleep -> sys/task/sleep

```lisp
inputs
r0 = time delay in usec (ulong)
trashes
none
info
0 for yield
```

### sys_task::suspend -> sys/task/suspend

```lisp
trashes
none
info
suspend current task, switch to next task
```

### sys_task::resume -> sys/task/resume

```lisp
inputs
r0 = task control node to resume (ptr)
outputs
r0 = task control node to resume (ptr)
trashes
r1-r2
```

### sys_task::defer -> sys/task/defer

```lisp
inputs
r0 = task control node to defer to (ptr)
trashes
none
info
restore task
```

### sys_task::set_priority -> sys/task/set_priority

```lisp
inputs
r0 = priority (uint)
trashes
r0-r4
```

### sys_task::timer -> sys/task/timer

```lisp
outputs
r0 = current time (ulong)
trashes
r0-r14
info
resume tasks ready to run
```

### sys_task::open_child -> sys/task/open_child

```lisp
inputs
r0 = name c string (pubyte)
r1 = spawn type (uint)
outputs
r0 = mailbox ID (id)
trashes
r0-r14
```

### sys_task::task_callback -> class/obj/null

### sys_task::lisp_sleep -> sys/task/lisp_sleep

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### sys_task::lisp_mailbox -> sys/task/lisp_mailbox

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## text

Super Class: view

### text::vtable -> gui/text/vtable

### text::create -> gui/text/create

### text::init -> gui/text/init

```lisp
inputs
r0 = text object (ptr)
r1 = vtable (pptr)
outputs
r0 = text object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### text::switch_text -> gui/text/switch_text

```lisp
inputs
r0 = text object (ptr)
outputs
r0 = text object (ptr)
trashes
r1-r14
```

### text::deinit -> gui/text/deinit

```lisp
inputs
r0 = text object (ptr)
outputs
r0 = text object (ptr)
trashes
r1-r14
```

### text::pref_size -> gui/text/pref_size

```lisp
inputs
r0 = text object (ptr)
outputs
r0 = text object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### text::draw -> gui/text/draw

```lisp
inputs
r0 = view object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

## textfield

Super Class: label

### textfield::vtable -> gui/textfield/vtable

### textfield::create -> gui/textfield/create

### textfield::init -> gui/textfield/init

```lisp
inputs
r0 = textfield object (ptr)
r1 = vtable (pptr)
outputs
r0 = textfield object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### textfield::draw -> gui/textfield/draw

```lisp
inputs
r0 = textfield object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = textfield object (ptr)
trashes
r1-r14
```

### textfield::key_down -> gui/textfield/key_down

```lisp
inputs
r0 = textfield object (ptr)
r1 = key event data (ptr)
outputs
r0 = textfield object (ptr)
trashes
r1-r14
```

### textfield::lisp_create -> gui/textfield/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## texture

Super Class: obj

### texture::vtable -> gui/texture/vtable

### texture::create -> gui/texture/create

### texture::init -> gui/texture/init

```lisp
inputs
r0 = texture object (ptr)
r1 = vtable (pptr)
r2 = texture handle (ulong)
r3 = texture width (pixels)
r4 = texture height (pixels)
outputs
r0 = texture object (ptr)
r1 = 0 if error, else ok
trashes
r1
```

### texture::get_metrics -> gui/texture/get_metrics

```lisp
inputs
r0 = texture object (ptr)
outputs
r0 = texture object (ptr)
r1 = texture handle (ulong)
r2 = width (pixels)
r3 = height (pixels)
trashes
r1-r3
```

### texture::deinit -> gui/texture/deinit

```lisp
inputs
r0 = texture object (ptr)
outputs
r0 = texture object (ptr)
trashes
r1-r14
```

## title

Super Class: label

### title::vtable -> gui/title/vtable

### title::create -> gui/title/create

### title::lisp_create -> gui/title/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### title::mouse_down -> gui/title/mouse_down

```lisp
inputs
r0 = title object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = title object (ptr)
trashes
r1-r14
```

### title::mouse_move -> gui/title/mouse_move

```lisp
inputs
r0 = title object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = title object (ptr)
trashes
r1-r14
```

## vdu

Super Class: view

### vdu::vtable -> gui/vdu/vtable

### vdu::create -> gui/vdu/create

### vdu::init -> gui/vdu/init

```lisp
inputs
r0 = vdu object (ptr)
r1 = vtable (pptr)
outputs
r0 = vdu object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### vdu::switch_font -> gui/vdu/switch_font

```lisp
inputs
r0 = vdu object (ptr)
outputs
r0 = vdu object (ptr)
trashes
r1-r14
```

### vdu::switch_size -> gui/vdu/switch_size

```lisp
inputs
r0 = vdu object (ptr)
outputs
r0 = vdu object (ptr)
trashes
r1-r14
```

### vdu::lisp_create -> gui/vdu/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### vdu::lisp_load -> gui/vdu/lisp_load

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### vdu::deinit -> gui/vdu/deinit

```lisp
inputs
r0 = vdu object (ptr)
outputs
r0 = vdu object (ptr)
trashes
r1-r14
```

### vdu::pref_size -> gui/vdu/pref_size

```lisp
inputs
r0 = vdu object (ptr)
outputs
r0 = vdu object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### vdu::draw -> gui/vdu/draw

```lisp
inputs
r0 = view object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

## view

Super Class: component

### view::vtable -> gui/view/vtable

### view::create -> gui/view/create

### view::init -> gui/view/init

```lisp
inputs
r0 = view object (ptr)
r1 = vtable (pptr)
outputs
r0 = view object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### view::add_front -> gui/view/add_front

```lisp
inputs
r0 = view object (ptr)
r1 = child view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r3
```

### view::add_back -> gui/view/add_back

```lisp
inputs
r0 = view object (ptr)
r1 = child view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r3
```

### view::sub -> gui/view/sub

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r2
```

### view::hide -> gui/view/hide

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::to_front -> gui/view/to_front

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::to_back -> gui/view/to_back

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::dirty -> gui/view/dirty

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::add_dirty -> gui/view/add_dirty

```lisp
inputs
r0 = view object (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::clr_opaque -> gui/view/clr_opaque

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::add_opaque -> gui/view/add_opaque

```lisp
inputs
r0 = view object (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::sub_opaque -> gui/view/sub_opaque

```lisp
inputs
r0 = view object (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::get_relative -> gui/view/get_relative

```lisp
inputs
r0 = view object (ptr)
r1 = ancestor view object (ptr)
r7 = view x (pixels)
r8 = view y (pixels)
outputs
r0 = view object (ptr)
r1 = ancestor view object (ptr)
r7 = relative x (pixels)
r8 = relative y (pixels)
trashes
r2, r7-r10
```

### view::forward -> gui/view/forward

```lisp
inputs
r0 = view object (ptr)
r1 = user data pointer (ptr)
r2 = callback (ptr)
outputs
r0 = view object (ptr)
trashes
...
callback api
inputs
r0 = child view object (ptr)
r1 = user data pointer (ptr)
outputs
r0 = child view object (ptr)
trashes
...
```

### view::backward -> gui/view/backward

```lisp
inputs
r0 = view object (ptr)
r1 = user data (ptr)
r2 = callback (ptr)
outputs
r0 = view object (ptr)
trashes
...
callback api
inputs
r0 = child view object (ptr)
r1 = user data pointer (ptr)
outputs
r0 = child view object (ptr)
trashes
...
```

### view::forward_tree -> gui/view/forward_tree

```lisp
inputs
r0 = view object (ptr)
r1 = user data pointer
r2 = down callback (ptr)
r3 = up callback (ptr)
outputs
r0 = view object (ptr)
trashes
...
callback api
inputs
r0 = view object (ptr)
r1 = user data pointer (ptr)
outputs
r0 = view object (ptr)
r1 = 0 if should not descend after down callback
trashes
...
```

### view::backward_tree -> gui/view/backward_tree

```lisp
inputs
r0 = view object (ptr)
r1 = user data pointer
r2 = down callback (ptr)
r3 = up callback (ptr)
outputs
r0 = view object (ptr)
trashes
...
callback api
inputs
r0 = view object (ptr)
r1 = user data pointer (ptr)
outputs
r0 = view object (ptr)
r1 = 0 if should not descend after down callback
trashes
...
```

### view::change -> gui/view/change

```lisp
inputs
r0 = view object (ptr)
r7 = new x (pixels)
r8 = new y (pixels)
r9 = new w (pixels)
r10 = new h (pixels)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::change_dirty -> gui/view/change_dirty

```lisp
inputs
r0 = view object (ptr)
r7 = new x (pixels)
r8 = new y (pixels)
r9 = new w (pixels)
r10 = new h (pixels)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::hit_tree -> gui/view/hit_tree

```lisp
inputs
r0 = view object (ptr)
r7 = x (pixels)
r8 = y (pixels)
outputs
r0 = view object (ptr)
r1 = 0 if not hit, else hit view object (ptr)
r7 = x relative to hit (pixels)
r8 = y relative to hit (pixels)
trashes
r1-r3
```

### view::find_id -> gui/view/find_id

```lisp
inputs
r0 = view object (ptr)
r1 = target id (long)
outputs
r0 = view object (ptr)
r1 = 0 if not found, else view object (ptr)
trashes
r1-r3
```

### view::draw_panel -> gui/view/draw_panel

```lisp
inputs
r0 = view object (ptr)
r1 = draw ctx (ptr)
r2 = flags (ulong)
r3 = depth (int)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::get_bounds -> gui/view/get_bounds

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
trashes
r7-r10
```

### view::set_bounds -> gui/view/set_bounds

```lisp
inputs
r0 = view object (ptr)
r7 = x (pixels)
r8 = y (pixels)
r9 = width (pixels)
r10 = height (pixels)
outputs
r0 = view object (ptr)
trashes
none
```

### view::set_flags -> gui/view/set_flags

```lisp
inputs
r0 = view object (ptr)
r1 = flag values (ulong)
r2 = flag mask (ulong)
outputs
r0 = view object (ptr)
r1 = new flag values (ulong)
trashes
r1-r3
```

### view::forward_callback -> class/obj/null

### view::forward_tree_callback -> class/obj/null

### view::deinit -> gui/view/deinit

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::add_child -> gui/view/add_back

```lisp
inputs
r0 = view object (ptr)
r1 = child view object (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r3
```

### view::draw -> class/obj/null

### view::hit -> gui/view/hit

```lisp
inputs
r0 = view object (ptr)
r7 = x (pixels)
r8 = y (pixels)
outputs
r0 = view object (ptr)
r1 = 0 if not, else hit
trashes
r1
```

### view::pref_size -> gui/view/pref_size

```lisp
inputs
r0 = view object (ptr)
outputs
r0 = view object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### view::layout -> class/obj/null

### view::event -> gui/view/event

```lisp
inputs
r0 = view object (ptr)
r1 = event data (ptr)
outputs
r0 = view object (ptr)
trashes
r1-r14
```

### view::mouse_down -> class/obj/null

### view::mouse_up -> class/obj/null

### view::mouse_move -> class/obj/null

### view::mouse_hover -> class/obj/null

### view::key_down -> class/obj/null

### view::key_up -> class/obj/null

### view::action -> class/obj/null

### view::lisp_create -> gui/view/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_sub -> gui/view/lisp_sub

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_hide -> gui/view/lisp_hide

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_add_child -> gui/view/lisp_add_child

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_add -> gui/view/lisp_add

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_add_back -> gui/view/lisp_add_back

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_pref_size -> gui/view/lisp_pref_size

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_change -> gui/view/lisp_change

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_change_dirty -> gui/view/lisp_change_dirty

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_add_opaque -> gui/view/lisp_add_opaque

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_sub_opaque -> gui/view/lisp_sub_opaque

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_set_flags -> gui/view/lisp_set_flags

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_add_dirty -> gui/view/lisp_add_dirty

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_dirty -> gui/view/lisp_dirty

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_layout -> gui/view/lisp_layout

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_event -> gui/view/lisp_event

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

### view::lisp_find_id -> gui/view/lisp_find_id

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

## window

Super Class: view

### window::vtable -> gui/window/vtable

### window::create -> gui/window/create

### window::init -> gui/window/init

```lisp
inputs
r0 = window object (ptr)
r1 = vtable (pptr)
outputs
r0 = window object (ptr)
r1 = 0 if error, else ok
trashes
r1-r14
```

### window::add_child -> gui/window/add_child

```lisp
inputs
r0 = window object (ptr)
r1 = child view object (ptr)
outputs
r0 = window object (ptr)
trashes
r1-r14
```

### window::pref_size -> gui/window/pref_size

```lisp
inputs
r0 = window object (ptr)
outputs
r0 = window object (ptr)
r9 = preferred width (pixels)
r10 = preferred height (pixels)
trashes
r1-r14
```

### window::layout -> gui/window/layout

```lisp
inputs
r0 = window object (ptr)
outputs
r0 = window object (ptr)
trashes
r1-r14
```

### window::draw -> gui/window/draw

```lisp
inputs
r0 = window object (ptr)
r1 = draw ctx (ptr)
outputs
r0 = window object (ptr)
trashes
r1-r14
```

### window::mouse_down -> gui/window/mouse_down

```lisp
inputs
r0 = window object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = window object (ptr)
trashes
r1-r14
```

### window::mouse_move -> gui/window/mouse_move

```lisp
inputs
r0 = window object (ptr)
r1 = mouse event data (ptr)
outputs
r0 = window object (ptr)
trashes
r1-r14
```

### window::lisp_create -> gui/window/lisp_create

```lisp
inputs
r0 = lisp object (ptr)
r1 = args list object (ptr)
outputs
r0 = lisp object (ptr)
r1 = return value object (ptr)
trashes
r1-r14
```

