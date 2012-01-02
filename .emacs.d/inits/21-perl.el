;;; Perl

;; cperl-mode
(require 'cperl-mode)
(defalias 'perl-mode 'cperl-mode)

;; custom variables
(setq cperl-indent-level 4)

;; perl-completion
;; (auto-install-from-emacswiki "perl-completion.el")
(require 'perl-completion)

;; key config
(define-key cperl-mode-map (kbd ";") nil)

;; hook
(defvar ac-source-my-perl-completion
  '((candidates . plcmp-ac-make-cands)))
(defun my-cperl-mode-hook ()
  (interactive)
  (perl-completion-mode t)
  (require 'auto-complete)
  (add-to-list 'ac-sources 'ac-source-my-perl-completion))
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)
