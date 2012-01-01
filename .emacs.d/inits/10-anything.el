;;; anything
;; (auto-install-batch "anything-minimal")
(require 'anything-config)
(setq anything-input-idle-delay 0.1)

(define-key global-map (kbd "C-x b") 'anything-for-files)
(define-key global-map (kbd "M-y")   'anything-show-kill-ring)
(define-key global-map (kbd "M-x")
  (lambda ()
    (interactive)
    (anything-other-buffer
     '(anything-c-source-extended-command-history anything-c-source-emacs-commands)
     "*anything emacs commands*")))
