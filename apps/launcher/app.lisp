;import settings
(run 'sys/lisp.inc)
(run 'gui/lisp.inc)

(structure 'event 0
	(byte 'win_button))

(defq app_list '(
	"apps/terminal/app"
	"apps/debug/app.lisp"
	"apps/netmon/app.lisp"
	"apps/boing/app.lisp"
	"apps/images/app.lisp"
	"apps/films/app.lisp"
	"apps/canvas/app.lisp"
	"apps/raymarch/app.lisp"
	"apps/calculator/app.lisp"
	"apps/hello/app.lisp"
	"apps/clock/app.lisp"
	"tests/farm.lisp"
	"tests/pipe.lisp"
	"tests/global.lisp"
	"tests/migrate.lisp"))

(ui-tree window (create-window 0) nil
	(ui-element _ (create-flow) ('flow_flags (bit-or flow_flag_down flow_flag_fillw) 'color argb_yellow)
		(each (lambda (path)
			(button-connect-click (ui-element _ (create-button) ('text path)) event_win_button)) app_list)))

(window-set-title window "Launcher")
(bind '(w h) (view-pref-size window))
(gui-add (view-change window 16 16 (add w 32) h))

(while t
	(cond
		((eq (read-long ev_msg_target_id (defq msg (mail-mymail))) event_win_button)
			(open-child (get (view-find-id window (read-long ev_msg_action_source_id msg)) 'text) kn_call_open))
		(t (view-event window msg))))
