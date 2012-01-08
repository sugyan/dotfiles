;;; Perl

;; cperl-mode
;; (require 'cperl-mode)
(autoload 'cperl-mode "cperl-mode" nil t)
(eval-after-load "cperl-mode"
  '(progn
     ;; indentation
     (setq cperl-indent-level 4)
     ;; key config
     (define-key cperl-mode-map (kbd ";") nil)))
(defalias 'perl-mode 'cperl-mode)

;; perl-completion
;; (auto-install-from-emacswiki "perl-completion.el")
(autoload 'perl-completion-mode "perl-completion" nil t)
(defvar ac-source-my-perl-completion
  '((candidates . plcmp-ac-make-cands)))

;; hook
(defun my-cperl-mode-hook ()
  (perl-completion-mode t)
  (when (boundp 'auto-complete-mode)
    (add-to-list 'ac-sources 'ac-source-my-perl-completion)))
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)
