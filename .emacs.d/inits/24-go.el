;;; Go

(add-hook 'before-save-hook #'gofmt-before-save)

(eval-after-load "go-mode"
  '(progn
     (define-key go-mode-map (kbd "C-c g") 'helm-go-package)))
