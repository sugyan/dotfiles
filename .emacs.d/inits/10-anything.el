;;; anything
;; (auto-install-batch "anything-minimal")

;; delay load
(defvar my-anything-key (kbd "C-z"))
(define-key global-map my-anything-key
  (lambda ()
    (interactive)
    (require 'anything-config)
    (define-key global-map my-anything-key 'anything-command-map)))

(eval-after-load "anything-config"
  '(progn
     (setq anything-input-idle-delay 0.1)
     ;; anything-grep
     ;; (auto-install-from-emacswiki "anything-grep.el")
     (require 'anything-grep)
     ;; replace commands
     (define-key global-map (kbd "C-x b") 'anything-for-files)
     (define-key global-map (kbd "M-y")   'anything-show-kill-ring)
     (define-key global-map (kbd "M-x")   'anything-M-x)
     ;; anything comamnd
     (define-key anything-command-map (kbd "r") 'anything-resume)
     (define-key anything-command-map (kbd "o") 'anything-occur)
     (define-key anything-command-map (kbd "g") 'anything-grep)

     ;; my anything
     (defun my-anything ()
       (interactive)
       (anything-other-buffer
        '(anything-c-source-buffers-list
          anything-c-source-recentf)
        "*anything my-anything*"))
     (define-key global-map (kbd "C-q") 'my-anything)))
