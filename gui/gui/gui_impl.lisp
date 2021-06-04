;import into the shared root env of this node !
(defq _ (env))
;comment next two lines out if need to...
(while (penv _) (setq _ (penv _)))
(eval '(env 307) _)
(import "sys/lisp.inc" _)
(import "class/lisp.inc" _)
(import "gui/lisp.inc" _)

;profiling callbacks on the GUI thread from :draw method !!!
(defq *profile* (env -1) *profile_ret* (list)
	select (list (task-mailbox) (mail-alloc-mbox))
	rate (/ 1000000 60) id t)

(enums +select 0
	(enum main timer))

(defun main ()
	;declare service
	(defq service (mail-declare (task-mailbox) "GUI_SERVICE" "GUI Service 0.2"))
	;init screen widget
	(def (defq screen (Backdrop)) :style :grid :color +argb_grey2 :ink_color +argb_grey1)
	(.-> screen (:change 0 0 1280 960) :dirty_all)
	(gui-init screen)
	;fire up the login app and clipboard service
	(open-child "apps/login/app.lisp" +kn_call_open)
	(open-child "apps/clipboard/app.lisp" +kn_call_open)
	(mail-timeout (elem +select_timer select) rate)
	(while id
		(defq msg (mail-read (elem (defq idx (mail-select select)) select)))
		(cond
			((= idx +select_main)
				;main mailbox
				(bind '(cmd view owner reply) msg)
				(cond
					((= cmd 0)
						;hide and sub view
						(.-> view :hide :sub))
					((= cmd 1)
						;add view at front
						(setf view +view_owner_id owner 0)
						(. screen :add_front view)
						(. view :set_flags +view_flag_dirty_all +view_flag_dirty_all))
					((= cmd 2)
						;add view at back
						(setf view +view_owner_id owner 0)
						(. screen :add_back view)
						(. view :set_flags +view_flag_dirty_all +view_flag_dirty_all)))
				(mail-send reply msg)
				(undef (env) 'msg 'view 'owner 'reply))
			((= idx +select_timer)
				;timer event
				(mail-timeout (elem +select_timer select) rate)
				(gui-update screen))))
	(each mail-free-mbox (slice 1 -1 select))
	(mail-forget service))
