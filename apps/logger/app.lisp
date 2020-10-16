;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; logger - ChrysaLisp Logging Service
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;imports
(import "sys/lisp.inc")
(import "class/lisp.inc")
(import "lib/logging/logging.inc")
(import "lib/hmap/hmap.inc")
(import "lib/yaml-data/yaml-data.lisp")
(import "apps/logger/logutils.lisp")

;single instance only
(when (= (length (mail-enquire +logging_srvc_name+)) 0)
  (mail-declare +logging_srvc_name+ (task-mailbox) "Logging Service 0.1")

  ; Process configuration file
  (bind '(fs fcfg? conf) (process_log_cfg))

  ; Setup general purpose information
  (defq
    reg   (hmap)
    lup   (getp-in conf :logging :levels)
    hand  (getp-in conf :logging :handlers)
    logrs (getp-in conf :logging :loggers)
    chand (getp hand (getp (getp logrs :console) :handler))
    active t)

  (defun-bind log-msg-writer (sstrm msg)
    ; (log-msg-writer stream mail-message) -> stream
    (defq
      msgd (deser-inbound msg)
      cnfg (hmap-find reg (getp msgd :module)))
    (log-write sstrm (str
                 " [" (getp msgd :msg-level)"] "
                 (getp cnfg :name)": ") (getp msgd :message)))

  (defun-bind register-logger (config)
    ; (register-logger properties) -> ?
    (defq hsh (hash config))
    (log-write fs " Registering " (getp config :name))
    (hmap-insert reg hsh config)
    (setp! config :token hsh t)
    ; Provide level and configuration information back
    (setp! config :levels lup t)
    (if (defq rl (getp logrs (getp config :logger)))
      (setp! config :configuration (getp hand (getp rl :handler)) t)
      (setp! config :configuration chand t))
    (mail-send
      (cat
        (char +log_event_registered+ long_size)
        (str (yaml-xser config)))
      (getp config :reciever)))

  ; Log Service Processing loop
  (while active
    (cond
      ; Shutdown (admin)
      ((= (defq id (get-long (defq msg (mail-read (task-mailbox))) ev_msg_target_id)) +log_event_shutdown+)
        (log-write fs " Shutting down ")
        (setq active nil fs nil))
      ; Information request about registrations (admin)
      ; Registration (client)
      ((= id +log_event_register+)
       (defq msgd (deser-inbound msg))
       (register-logger msgd))
      ; Reconfiguration (client)
      ; Log Message (client)
      ((= id +log_event_logmsg+)
       (log-msg-writer fs msg))
      ; Should throw exception
      (t
        (log-write " Unknown " msg))))
  (mail-forget +logging_srvc_name+ (task-mailbox) "Logging Service 0.1")
)