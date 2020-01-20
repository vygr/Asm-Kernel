;imports
(import 'sys/lisp.inc)
(import 'class/lisp.inc)
(import 'gui/lisp.inc)

;add event id etc
(defq clock_size 256 clock_scale 1 id t)

;define events we will use
(structure 'event 0
	(byte 'win_close))

;create a window with a label
(ui-tree window (create-window window_flag_close) nil
	(ui-element display (create-label) ('text "00:00:00" 'color argb_black 'ink_color argb_red
		'flow_flags (+ flow_flag_align_hcenter flow_flag_align_vcenter)
		'font (create-font-ctf "fonts/Hack-Regular.ctf" 48)))
	(ui-element clock (create-canvas clock_size clock_size clock_scale)))

;set a name to the window and clear clock face
(canvas-set-flags (canvas-fill clock 0) 1)
(gui-add (apply view-change (cat (list window 164 16)
	(view-pref-size (window-set-title (window-connect-close window event_win_close) "Clock")))))

;create child and send args
(mail-send (list display clock (* clock_size 1.0) (* clock_scale 1.0))
	(defq mbox (open-child "apps/clock/child.lisp" kn_call_open)))

;main app loop
(while id
	(cond
		((= (setq id (get-long (defq msg (mail-read (task-mailbox))) ev_msg_target_id)) event_win_close)
			(setq id nil))
		(t (view-event window msg))))

;close child and window
(mail-send "" mbox)
(view-hide window)
