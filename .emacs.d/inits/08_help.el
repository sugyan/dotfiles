(add-hook 'help-mode-hook
          '(lambda ()
             (define-key help-mode-map (kbd "M-[") 'help-go-back)
             (define-key help-mode-map (kbd "M-]") 'help-go-forward)))
