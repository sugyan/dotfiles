;;; perl.el

;; cperl-mode
(require 'cperl-mode)
(defalias 'perl-mode 'cperl-mode)

;; perl-completion
;; (auto-install-from-emacswiki "perl-completion.el")
(require 'perl-completion)

;; key config
(define-key cperl-mode-map (kbd ";") nil)

;; hook
(add-hook 'cperl-mode-hook (lambda ()
  (perl-completion-mode t)
  (require 'auto-complete)
  (add-to-list 'ac-sources 'ac-source-perl-completion)))
