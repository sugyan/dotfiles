;;; key config

;; exchange alt <-> meta
(setq ns-alternate-modifier 'alt)
(setq ns-command-modifier 'meta)

;; exchange C-j <-> C-m
(keyboard-translate ?\C-j ?\C-m)
(keyboard-translate ?\C-m ?\C-j)

;; global-set-key
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'other-window)

;; sticky
;; (auto-install-from-emacswiki "sticky.el")
(require 'sticky)
(use-sticky-key ?\; sticky-alist:en)
