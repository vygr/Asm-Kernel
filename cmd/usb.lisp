;imports
(import "class/lisp.inc")
(import "lib/options/options.inc")

(defq usage `(
(("-h" "--help")
"Usage: usb [options]
	options:
		-h --help: this help info.
		-c --count num: default 1.
	Start USB link driver/s.")
(("-c" "--count")
	,(lambda (args arg)
		(setq cnt (str-to-num (elem 0 args)))
		(slice 1 -1 args)))
))

(defun main ()
	;initialize pipe details and command args, abort on error
	(when (and
			(defq stdio (create-stdio))
			(defq cnt 1 args (options stdio usage)))
		;start usb links, on same node !
		(times cnt (mail-send (defq id (open-child "sys/link/usb_link" kn_call_child)) "usb"))))
