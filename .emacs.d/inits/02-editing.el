;;; 02-editing.el --- editing config
;;; Commentary:

;;; Code:

(custom-set-variables
 '(truncate-lines           t)              ; truncate line
 '(indent-tabs-mode         nil)            ; don't use tab
 '(make-backup-files        nil)            ; don't make *~ files
 '(find-file-visit-truename t)              ; visit truename
 '(read-file-name-completion-ignore-case t) ; for case insensitive find-file
 '(tab-width 4)
 '(whitespace-style '(face tabs trailing empty tab-mark)))

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)
;; electric pair mode
(electric-pair-mode t)
;; visualize whitespaces(tabs)
(global-whitespace-mode t)
(custom-set-faces
 '(whitespace-tab ((((class color) (background dark))
     :background "grey10" :foreground "grey20"))))

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

;; auto insert
(auto-insert-mode t)
(with-eval-after-load "yasnippet"
  (eval
   '(progn
      (dolist (mode '(html-mode cperl-mode))
        (define-auto-insert mode (lambda () (insert "template") (yas/expand)))))))

;; undo
(require 'undo-tree)
(global-undo-tree-mode)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; uniquify
;; set to "bar/mumble/name" style
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; dired
(require 'dired)
(define-key dired-mode-map (kbd "r")   'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "C-o") nil)
;; direx
(require 'direx)
(global-set-key (kbd "C-x d") 'direx-project:jump-to-project-root)
(define-key direx:direx-mode-map (kbd "C-o") nil)
;; projectile
(require 'projectile)
(custom-set-variables
 '(projectile-project-root-files-bottom-up
   '(".projectile"        ; projectile project marker
     "Gemfile"            ; Bundler file
     "package.json"       ; npm package file
     "cpanfile"           ; CPAN dependencies for Perl applications
     ".git"))             ; Git VCS root dir
 '(projectile-enable-caching t))
(projectile-global-mode t)

;; isearch
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;; recentf
(require 'recentf-ext)
(custom-set-variables
 '(recentf-auto-cleanup 300)
 '(recentf-max-saved-items 1000))

;; open junk file
(require 'open-junk-file)
(custom-set-variables
 '(open-junk-file-format "~/.emacs.d/junk/%Y/%m/%d-%H%M%S."))

;; yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)

;;; 02-editing.el ends here
