;;; Help

(eval-when-compile (require 'help-mode))
(define-key help-mode-map (kbd "M-[") 'help-go-back)
(define-key help-mode-map (kbd "M-]") 'help-go-forward)
