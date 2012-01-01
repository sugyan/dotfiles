;;; Perl

;; cperl-mode
(require 'cperl-mode)
(defalias 'perl-mode 'cperl-mode)

;; perl-completion
;; (auto-install-from-emacswiki "perl-completion.el")
(require 'perl-completion)

;; key config
(define-key cperl-mode-map (kbd ";") nil)

;; hook
(defun my-cperl-mode-hook ()
  (interactive)
  (perl-completion-mode t)
  (require 'auto-complete)
  (add-to-list 'ac-sources 'ac-source-perl-completion))
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)
