(import "./app.inc")

(defun main ()
	(defq clip_service (mail-declare (task-mailbox) "CLIPBOARD_SERVICE" "Clipboard Service 0.2")
		clipboard "")
	(while t
		(env-push)
		(defq msg (mail-read (task-mailbox)))
		(cond
			((= (defq type (elem 0 msg)) +clip_type_put)
				;put string on clipboard
				(setq clipboard (elem 1 msg)))
			((= type +clip_type_get)
				;get string from clipboard
				(mail-send (elem 1 msg) clipboard)))
		(env-pop))
	(mail-forget clip_service))
