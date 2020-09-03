;imports
(import 'sys/lisp.inc)
(import 'class/lisp.inc)
(import 'gui/lisp.inc)

(structure '+event 0
	(byte 'close+ 'max+ 'min+))

(defq id t index 0 xv 4 yv 0
	frames (map (lambda (_) (canvas-load (cat "apps/boing/taoball_" (str _) ".cpm") load_flag_shared)) (range 1 12))
	sframes (map (lambda (_) (canvas-load (cat "apps/boing/taoball_s_" (str _) ".cpm") load_flag_shared)) (range 1 12)))

(ui-window window ()
	(ui-title-bar _ "Boing" (0xea19 0xea1b 0xea1a) +event_close+)
	(ui-backdrop backdrop (:color argb_black :ink_color argb_white)
		(ui-element frame (elem 0 frames))
		(ui-element sframe (elem 0 sframes))))

(defun-bind main ()
	(bind '(x y w h) (apply view-locate (view-pref-size window)))
	(gui-add (view-change window x y w h))
	(while id
		(bind '(_ _ backdrop_width backdrop_height) (view-get-bounds backdrop))
		(defq index (% (inc index) (length frames))
			old_frame frame frame (elem index frames)
			old_sframe sframe sframe (elem index sframes))
		(bind '(x y w h) (view-get-bounds old_frame))
		(bind '(sx sy sw sh) (view-get-bounds old_sframe))
		(view-add-dirty (view-add-dirty backdrop sx sy sw sh) x y w h)
		(setq x (+ x xv) y (+ y yv) yv (inc yv))
		(if (> y (- backdrop_height h)) (setq y (- backdrop_height h) yv -22))
		(if (< x 0) (setq x 0 xv (abs xv)))
		(if (> x (- backdrop_width w)) (setq x (- backdrop_width w) xv (neg (abs xv))))
		(view-set-bounds frame x y w h)
		(view-set-bounds sframe (+ x 8) (+ y 64) sw sh)
		(view-sub old_sframe)
		(view-sub old_frame)
		(view-add-front (view-add-back backdrop sframe) frame)
		(view-dirty sframe)
		(view-dirty frame)
		(while (mail-poll (array (task-mailbox)))
			(cond
				((= (setq id (get-long (defq msg (mail-read (task-mailbox))) ev_msg_target_id)) +event_close+)
					(setq id nil))
				((= id +event_min+)
					;min button
					(bind '(x y w h) (apply view-fit (cat (view-get-pos window) (view-pref-size window))))
					(view-change-dirty window x y w h))
				((= id +event_max+)
					;max button
					(bind '(x y) (view-get-pos window))
					(bind '(w h) (view-pref-size window))
					(bind '(x y w h) (view-fit x y (/ (* w 5) 3) (/ (* h 5) 3)))
					(view-change-dirty window x y w h))
				(t (view-event window msg))))
		(task-sleep 40000))
	(view-hide window))
