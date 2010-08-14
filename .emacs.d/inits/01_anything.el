(require 'anything-config)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-recentf
                             anything-c-source-extended-command-history
                             anything-c-source-emacs-commands
                             anything-c-source-bookmarks
                             anything-c-source-man-pages))
(define-key anything-map (kbd "C-j") 'anything-exit-minibuffer) ; "C-j"で決定したときに別frameが開いてしまうのを防ぐ
(define-key anything-map (kbd "M-v") 'anything-previous-source)
(define-key anything-map (kbd "C-v") 'anything-next-source)
(define-key anything-map (kbd "C-;") 'abort-recursive-edit)
(global-set-key (kbd "C-;") 'anything)
(global-set-key (kbd "C-c r") 'anything-resume)
