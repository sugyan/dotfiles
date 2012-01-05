;;; anything
;; (auto-install-batch "anything-minimal")
(require 'anything-config)
(setq anything-input-idle-delay 0.1)

(custom-set-variables
 ;; prefix key
 '(anything-command-map-prefix-key "C-z"))

;; replace commands
(define-key global-map (kbd "C-x b") 'anything-for-files)
(define-key global-map (kbd "M-y")   'anything-show-kill-ring)
(define-key global-map (kbd "M-x")   'anything-M-x)
(define-key anything-command-map (kbd "r") 'anything-resume)
(define-key anything-command-map (kbd "o") 'anything-occur)

;; my anything
(defun my-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-buffers-list
     anything-c-source-recentf)
   "*anything my-anything*"))
(define-key global-map (kbd "C-;") 'my-anything)
