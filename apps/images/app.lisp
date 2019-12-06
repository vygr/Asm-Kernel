;imports
(import 'sys/lisp.inc)
(import 'class/lisp.inc)
(import 'gui/lisp.inc)

(structure 'event 0
	(byte 'win_close 'win_next 'win_prev))

(defq images '(apps/images/frill.cpm apps/images/magicbox.cpm
	apps/images/captive.cpm apps/images/balls.cpm apps/images/banstand.cpm
	apps/images/bucky.cpm apps/images/circus.cpm apps/images/cyl_test.cpm
	apps/images/logo.cpm apps/images/mice.cpm apps/images/molecule.cpm
	apps/images/nippon3.cpm apps/images/piramid.cpm apps/images/rings.cpm
	apps/images/sharpend.cpm apps/images/stairs.cpm apps/images/temple.cpm
	apps/images/vermin.cpm) index 0 id t)

	(ui-tree window (create-window window_flag_close) nil
		(ui-element image_flow (create-flow) ('flow_flags (logior flow_flag_down flow_flag_fillw))
			(ui-element _ (create-flow) ('flow_flags (logior flow_flag_right flow_flag_fillh)
					'color toolbar_col 'font (create-font "fonts/Entypo.otf" 32))
				(component-connect (ui-element _ (create-button) ('text "")) event_win_prev)
				(component-connect (ui-element _ (create-button) ('text "")) event_win_next))
			(ui-element frame (canvas-load (elem index images) 0))))

	(gui-add (apply view-change (cat (list window 200 200)
		(view-pref-size (window-set-title (window-connect-close window event_win_close) (elem index images))))))

	(defun win-refresh (_)
		(view-sub frame)
		(setq index _ frame (canvas-load (elem index images) load_flag_film))
		(view-layout (view-add-back image_flow frame))
		(bind '(x y _ _) (view-get-bounds (window-set-title window (elem index images))))
		(bind '(w h) (view-pref-size window))
		(view-change-dirty window x y w h))

(while id
	(cond
		((= (setq id (get-long (defq msg (mail-read (task-mailbox))) ev_msg_target_id)) event_win_close)
			(setq id nil))
		((= id event_win_next)
			(win-refresh (% (inc index) (length images))))
		((= id event_win_prev)
			(win-refresh (% (+ (dec index) (length images)) (length images))))
		(t (view-event window msg))))

(view-hide window)
