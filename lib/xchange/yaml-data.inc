;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yaml-data - ChrysaLisp YAML Data Processor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; imports
(import "lib/xchange/scanner.lisp")
(import "lib/xchange/parser.lisp")
(import "lib/xchange/constructor.lisp")
(import "lib/xchange/emiter.lisp")

; Reader Options
;   :keys-to-kw   when true, properties keys converted to keywords
;                 if doing so, spaces will be set to underscores and
;                 result will be prefixed with ':' before making
;                 the symbol
;                 Default: False
;   :vals-to-kw   when true, string values that have ':' as first
;                 character will be converted to keyword
;                 Default: False
;   :vals-to-num  when true, will attempt to detect entire string value
;                 is either integer of real and convert it to such

(defq reader-properties
      (emap-kv
        :keys-to-kw  t    ; Converts map keys to keywords
        :vals-to-kw  t    ; Converts value string with 1st char ":" to kw
        :vals-to-num t))  ; Converts numerics to native (int, real, nums)

; Writer Options
;   :kw-to-str    when true, any keyword will be quoted as YAML
;                 parses tend to choke otherwise. If false the
;                 prefix ':' will be dropped
;                 Default: True

(defq writer-properties
      (emap-kv
        :kw-to-str  t       ; Quotes keywords otherwise strips ':'
        ))

(defun merge-args (core-args in-args)
  (defq base-args (merges core-args))
  (cond
    ((empty? in-args))
    ((= (logand (length in-args) 1) 1)
     (throw "Uneven arguments to yaml" in-args))
    (t
      (setq base-args (merges base-args in-args))))
  base-args)
; Reader

(defun yaml-construct (ast in-args)
  ; (yaml-construct tokens in-args) -> object | exception | nil
  ; Parses yaml tokens and returns ChyrsaLisp objects
  (catch (construct ast in-args) (throw "Construct error " t)))

(defun yaml-parse (tokens in-args)
  ; (yaml-parse tokens in-args) -> list | exception | nil
  ; Parses yaml tokensers and returns yaml AST
  (catch (parse tokens in-args) (throw "Parse error " t)))

(defun yaml-scan (ystring)
  ; (yaml-scan string) -> list | exception | nil
  ; Performs scan on string returning list of
  ; lexical yaml tokens
  (scan ystring))

(defun yaml-from-strg (ystring in-args)
  ; (yaml-read-string string in-args) -> list | exception | nil
  ; Converts YAML string to ChyrsaLisp data structures
  (if (nil? in-args)
      (setq in-args (copy reader-properties))
      (setq in-args (merge-args reader-properties in-args)))
  (yaml-construct (yaml-parse (yaml-scan ystring) in-args) in-args))

(defun yaml-read (fname &rest in-args)
  ; (yaml-read fname [in-args]) -> list | exception | nil
  ; Opens and reads in a YAML file and returns
  ; native ChyrsaLisp data structures
  (defq base-args (merge-args reader-properties in-args))
  (if (zero? (age fname))
    (throw (str fname " not found") t)
    (yaml-from-strg (load fname) base-args)))

; Writer

(defun yaml-emit (stream obj in-args)
  (emit stream obj in-args))

(defun yaml-from-obj (obj in-args)
  (str (yaml-emit (string-stream (cat "")) obj in-args)))

(defun yaml-write (fname obj &rest in-args)
  (defq base-args (merge-args writer-properties (pairs-into-kv in-args)))
  (defq res (yaml-from-obj obj base-args))
  (if fname
      (save res fname)))
