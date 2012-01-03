;;; Help
(eval-after-load "help-mode"
  '(progn
     (define-key help-mode-map (kbd "M-[") 'help-go-back)
     (define-key help-mode-map (kbd "M-]") 'help-go-forward)))
