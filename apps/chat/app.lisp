;imports
(import "sys/lisp.inc")
(import "class/lisp.inc")
(import "gui/lisp.inc")

(structure '+event 0
	(byte 'close+)
	(byte 'connect+ 'disconnect+)
	(byte 'send+))

(defq vdu_width 60 vdu_height 30)

(ui-window window (:color argb_grey4)
	(ui-title-bar _ "Chat" (0xea19) +event_close+)
	(ui-tool-bar _ ()
		(ui-buttons (0xe9ed 0xe9e8) +event_connect+))
	(ui-flow _ (:flow_flags flow_right_fill :ink_color argb_white :color argb_white :ink_color argb_black)
		(ui-label _ (:text "User:"))
		(component-connect (ui-textfield chat_user (:text "guest")) +event_connect+))
	(ui-vdu vdu (:vdu_width vdu_width :vdu_height vdu_height :ink_color argb_white))
	(ui-flow _ (:flow_flags flow_right_fill :ink_color argb_white :color argb_white :ink_color argb_black)
		(ui-label _ (:text "Chat:"))
		(component-connect (ui-textfield chat_text (:text "")) +event_send+)))

(defun-bind vdu-print (vdu buf s)
	(each (lambda (c)
		(cond
			((eql c (ascii-char 10))
				;line feed and truncate
				(if (> (length (push buf "")) (const vdu_height))
					(setq buf (slice (const (dec (neg vdu_height))) -1 buf))))
			(t	;char
				(elem-set -2 buf (cat (elem -2 buf) c))))) s)
	(vdu-load vdu buf 0 0 (length (elem -2 buf)) (dec (length buf))) buf)

(defun-bind broadcast (text)
	(setq text (cat "<" (get :text chat_user) "> " text (ascii-char 10)))
	(each (# (mail-send text (str-to-num (elem 1 (split %0 ","))))) (mail-enquire "CHAT_SERVICE")))

(defun-bind main ()
	(defq id t text_buf (list "") select (array (task-mailbox)) entry nil)
	(bind '(x y w h) (apply view-locate (view-pref-size window)))
	(gui-add (view-change window x y w h))
	(while id
		(defq idx (mail-select select) msg (mail-read (elem idx select)))
		(cond
			((/= idx 0)
				;chat text from network
				(setq text_buf (vdu-print vdu text_buf msg)))
			((= (setq id (get-long msg ev_msg_target_id)) +event_close+)
				;close
				(setq id nil))
			((= id +event_connect+)
				;connect to network
				(unless entry
					(push select (mail-alloc-mbox))
					(setq entry (mail-declare "CHAT_SERVICE" (elem 1 select) "Chat Service 0.1"))
					(broadcast "Has joined the chat !")))
			((= id +event_disconnect+)
				;disconnect to network
				(when entry
					(broadcast "Has left the chat !")
					(mail-free-mbox (pop select))
					(mail-forget entry)
					(setq entry nil)))
			((= id +event_send+)
				;send to network
				(broadcast (get :text chat_text))
				(set chat_text :text "")
				(view-dirty (view-layout chat_text)))
			(t (view-event window msg))))
	(when entry
		(broadcast "Has left the chat !")
		(mail-forget entry)
		(mail-free-mbox (elem 1 select)))
	(view-hide window))
