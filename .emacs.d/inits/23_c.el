(add-hook 'c-mode-hook
          (lambda ()
            (define-key c-mode-map (kbd "C-m") 'newline-and-indent)
            (define-key c-mode-map (kbd "C-c C-c") 'compile)))
