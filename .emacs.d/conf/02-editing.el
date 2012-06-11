;;; editing config

(custom-set-variables
 '(truncate-lines           t)               ; truncate line
 '(indent-tabs-mode         nil)             ; don't use tab
 '(make-backup-files        nil)             ; don't make *~ files
 '(find-file-visit-truename t)               ; visit truename
 '(read-file-name-completion-ignore-case t)) ; for case insensitive find-file

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)

;; auto insert
(auto-insert-mode t)
(eval-after-load "yasnippet"
  '(progn
     (custom-set-variables '(auto-insert-alist '(())))
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

;; smartchr
;; (auto-install-from-url "https://raw.github.com/imakado/emacs-smartchr/master/smartchr.el")
(require 'smartchr)
(define-key global-map (kbd "=")  (smartchr '(" = " "=")))
(define-key global-map (kbd "(")  (smartchr '("(`!!')" "(")))
(define-key global-map (kbd "{")  (smartchr '("{`!!'}" "{")))
(define-key global-map (kbd "[")  (smartchr '("[`!!']" "[")))
(define-key global-map (kbd "<")  (smartchr '("<`!!'>" "<")))
(define-key global-map (kbd ">")  (smartchr '(">" " => ")))
(define-key global-map (kbd "'")  (smartchr '("'`!!''" "'")))
(define-key global-map (kbd "\"") (smartchr '("\"`!!'\"" "\"")))

;; uniquify
;; set to "bar/mumble/name" style
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; dired
(require 'dired)
(define-key dired-mode-map (kbd "r")   'wdired-change-to-wdired-mode)
(define-key dired-mode-map (kbd "C-o") nil)

;; grep
(setq grep-command "ack --nogroup ")

;; isearch
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;; recentf
;; (auto-install-from-emacswiki "recentf-ext.el")
(require 'recentf-ext)
(setq recentf-max-saved-items 500)

;; (auto-install-from-emacswiki "open-junk-file.el")
(require 'open-junk-file)
(custom-set-variables
 '(open-junk-file-format "~/.emacs.d/junk/%Y/%m/%d-%H%M%S."))

;; yes-or-no-p
(defalias 'yes-or-no-p 'y-or-n-p)
