;;; editing config

(setq-default
 truncate-lines t                       ; truncate line
 tab-width 4                            ; tab width
 indent-tabs-mode nil)                  ; no use tab

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)

;; auto insert
(auto-insert-mode t)

;; auto-complete
;; (auto-install-batch "auto-complete development version")
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-filename ac-source-words-in-same-mode-buffers))
(setq ac-use-menu-map t)
(setq ac-quick-help-delay 0.5)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

;; uniquify
;; set to "bar/mumble/name" style
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; dired
(require 'dired)
(define-key dired-mode-map (kbd "r")   'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "C-o") nil)

;; iswitchb
(iswitchb-mode t)
(setq read-buffer-function 'iswitchb-read-buffer)

;; yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)
