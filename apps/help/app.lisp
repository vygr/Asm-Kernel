;imports
(import 'sys/lisp.inc)
(import 'class/lisp.inc)
(import 'gui/lisp.inc)

(structure 'event 0
	(byte 'win_close 'win_button))

(defq id t keys (list) vals (list) vdu_height 40 text_buf (list ""))

(defun-bind populate-help ()
	(defq state t vdu_width 1 k (list) v (list))
	(each-line (lambda (_)
		(when (/= 0 (length (defq s (split (setq _ (trim-end _ (ascii-char 13))) " "))))
			(defq f (elem 0 s))
			(cond
				(state (cond
					((eql f "###") (push k (sym (elem 1 s))) (push v ""))
					((eql f "```lisp") (setq state nil))))
				((eql f "```") (setq state t))
				(t (elem-set -2 v (cat (elem -2 v) _ (ascii-char 10))))))) (file-stream "docs/CLASSES.md"))
	(each (lambda (k v)
		(when (/= 0 (length v))
			(defq _ (split k ":"))
			(cond
				((and (>= (length (elem 0 _)) 4) (eql "lisp" (slice 0 4 (elem 0 _)))))
				((and (>= (length (elem 1 _)) 5) (eql "lisp_" (slice 0 5 (elem 1 _)))))
				(t (push keys k) (push vals v))))) k v)
	(each (lambda (_)
		(def (defq b (create-button)) 'text _ 'border 0
			'flow_flags (logior flow_flag_align_vcenter flow_flag_align_hleft))
		(view-add-child index (component-connect b event_win_button))) keys)
	(def vdu 'vdu_width
		(reduce max (map (lambda (_)
			(reduce max (map length (split _ (ascii-char 10))))) vals))))

(defun-bind vdu-print (vdu buf s)
	(each (lambda (c)
		(cond
			((eql c (ascii-char 10))
				;line feed and truncate
				(push buf "")
				(if (> (length buf) vdu_height)
					(setq buf (slice (dec (neg vdu_height)) -1 buf))))
			(t	;char
				(elem-set -2 buf (cat (elem -2 buf) c))))) s)
	(vdu-load vdu buf 0 0 (length (elem -2 buf)) (dec (length buf))) buf)

(ui-tree window (create-window window_flag_close) ('color argb_black)
	(ui-element _ (create-flow) ('flow_flags (logior flow_flag_right flow_flag_fillh flow_flag_lastw)
		'font (create-font "fonts/Hack-Regular.ctf" 16))
		(ui-element index_scroll (create-scroll scroll_flag_vertical) ('color slider_col)
			(ui-element index (create-flow) ('flow_flags (logior flow_flag_down flow_flag_fillw)
				'color argb_white)))
		(ui-element vdu (create-vdu) ('vdu_height vdu_height 'ink_color argb_cyan))))

(populate-help)
(bind '(w h) (view-pref-size index))
(view-change index 0 0 (def index_scroll 'min_width w) h)
(gui-add (apply view-change (cat (list window 32 32)
	(view-pref-size (window-set-title (window-connect-close window event_win_close) "Help")))))

(while id
	(cond
		((= (setq id (get-long (defq msg (mail-read (task-mailbox))) ev_msg_target_id)) event_win_close)
			(setq id nil))
		((= id event_win_button)
			(defq _ (find (sym (get (view-find-id window (get-long msg ev_msg_action_source_id)) 'text)) keys))
			(when _
				(setq text_buf (vdu-print vdu text_buf (str
					"----------------------" (ascii-char 10)
					(elem _ keys) (ascii-char 10)
					"----------------------" (ascii-char 10)
					(elem _ vals)
					"----------------------" (ascii-char 10) (ascii-char 10))))))
		(t (view-event window msg))))

(view-hide window)
