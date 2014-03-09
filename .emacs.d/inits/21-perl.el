;;; Perl
;; cperl-mode from package-install for cperl-indent-subs-specially
;; http://d.hatena.ne.jp/syohex/20120818/1345302707
;; (package-install 'cperl-mode)
(require 'flymake)

(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"  . cperl-mode))
(add-to-list 'auto-mode-alist '("cpanfile" . cperl-mode))
(add-to-list 'flymake-allowed-file-name-masks '("\\.t\\'"    flymake-perl-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.psgi\\'" flymake-perl-init))
(eval-after-load "cperl-mode"
  '(progn
     (cperl-set-style "PerlStyle")
     (define-key cperl-mode-map (kbd "C-m") 'newline-and-indent)
     (define-key cperl-mode-map (kbd "M-n") 'flymake-goto-next-error)
     (define-key cperl-mode-map (kbd "M-p") 'flymake-goto-prev-error)
     (define-key cperl-mode-map (kbd "C-c d") 'helm-perldoc)
     (define-key cperl-mode-map (kbd "C-c h") 'helm-perldoc:history)))
(custom-set-variables
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset     -4)
 '(cperl-indent-subs-specially  nil))

;; flymake
(require 'projectile)
(defadvice flymake-perl-init (after flymake-perl-init-add-libs activate)
  (when (projectile-verify-file "cpanfile")
    (push (concat "-I" (projectile-expand-root "local/lib/perl5")) (nth 1 ad-return-value))
    (push (concat "-I" (projectile-expand-root "lib")) (nth 1 ad-return-value))))

;; hook
(require 'helm-perldoc)
(defun my-cperl-mode-hook ()
  (helm-perldoc:setup)
  (flymake-mode t)
  (when (boundp 'auto-complete-mode)
    (eval
     '(progn
        (add-to-list 'ac-sources 'ac-source-dictionary)))))
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)
