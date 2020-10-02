;;;;;;;;;;;;;;;;;;;;
; VP Assembler Child
;;;;;;;;;;;;;;;;;;;;

;imports
(import "sys/lisp.inc")
(import "class/lisp.inc")

;read args from parent
(bind '((files mbox *abi* *cpu* *debug_mode* *debug_emit* *debug_inst*) _)
	(read (string-stream (mail-read (task-mailbox))) (ascii-code " ")))

;set up reply stream
(defq msg_out (out-stream mbox))

;redirect print to my msg_out
(defun-bind print (&rest args)
	(write msg_out (apply str (push args (ascii-char 10)))))

;catch any errors
(catch
	;compile the file list
	(within-compile-env (# (each include files)))
	(print _))
