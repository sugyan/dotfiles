;;; anything
;; (auto-install-batch "anything-minimal")
(require 'anything-config)
(setq anything-input-idle-delay 0.1)

;; key
(define-key global-map (kbd "C-z") 'anything-command-map)

;; replace commands
(define-key global-map (kbd "C-x b") 'anything-for-files)
(define-key global-map (kbd "M-y")   'anything-show-kill-ring)
(define-key global-map (kbd "M-x")   'anything-M-x)

;; my anything
(defun my-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-buffers-list
     anything-c-source-recentf
     anything-c-source-extended-command-history)
   "*anything my-anything*"))
(define-key global-map (kbd "C-;") 'my-anything)
