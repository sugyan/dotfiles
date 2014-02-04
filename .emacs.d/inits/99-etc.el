;;; etc

;; for emacsclient command
(require 'server)
(when (not (eq t (server-running-p server-name)))
  (server-start))
