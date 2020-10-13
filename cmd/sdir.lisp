;imports
(import "sys/lisp.inc")
(import "class/lisp.inc")
(import "lib/options/options.inc")

(defq usage `(
(("-h" "--help")
"Usage: sdir [options] [prefix]
	options:
		-h --help: this help info.")
))

(defun-bind main ()
	;initialize pipe details and command args, abort on error
	(when (and
			(defq stdio (create-stdio))
			(defq args (options stdio usage)))
		(defq prefix (if (> (length args) 1) (elem 1 args) ""))
		(each print (mail-enquire prefix))))
