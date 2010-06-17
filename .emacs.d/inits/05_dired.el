(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "o")   'dired-display-file)
            (define-key dired-mode-map (kbd "C-o") 'other-window)))
