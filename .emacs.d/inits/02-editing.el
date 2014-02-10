;;; editing config

(custom-set-variables
 '(truncate-lines           t)              ; truncate line
 '(indent-tabs-mode         nil)            ; don't use tab
 '(make-backup-files        nil)            ; don't make *~ files
 '(find-file-visit-truename t)              ; visit truename
 '(read-file-name-completion-ignore-case t) ; for case insensitive find-file
 '(dired-use-ls-dired nil))                 ; dired ls

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)
;; electric pair mode
(electric-pair-mode t)
;; key-combo
(require 'key-combo)
(key-combo-load-default)

;; auto insert
(auto-insert-mode t)
(eval-after-load "yasnippet"
  '(progn
     (dolist (mode '(html-mode cperl-mode))
       (define-auto-insert mode (lambda () (insert "template") (yas/expand))))))

;; auto-complete
;; (package-install 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(custom-set-variables
 '(ac-use-menu-map           t)
 '(ac-dictionary-directories '("~/.emacs.d/etc/ac-dict")))
(define-key ac-menu-map (kbd "C-n")   'ac-next)
(define-key ac-menu-map (kbd "C-p")   'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)

;; uniquify
;; set to "bar/mumble/name" style
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; dired
(require 'dired)
(define-key dired-mode-map (kbd "r")   'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "C-o") nil)

;; isearch
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;; recentf
(require 'recentf-ext)
(custom-set-variables
 '(recentf-auto-cleanup 300)
 '(recentf-max-saved-items 500))

;; open junk file
(require 'open-junk-file)
(custom-set-variables
 '(open-junk-file-format "~/.emacs.d/junk/%Y/%m/%d-%H%M%S."))

;; yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)
