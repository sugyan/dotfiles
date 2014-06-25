;;; Perl --- perl

;;; Commentary:
;; cperl-mode from package-install for cperl-indent-subs-specially
;; http://d.hatena.ne.jp/syohex/20120818/1345302707
;; (package-install 'cperl-mode)

;;; Code:

(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"  . cperl-mode))
(add-to-list 'auto-mode-alist '("cpanfile" . cperl-mode))
(eval-after-load "cperl-mode"
  '(progn
     (helm-perldoc:setup)
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
(defadvice flymake-perl-init (after flymake-perl-init-add-libs activate)
  "Modify perl-init function."
  (require 'projectile)
  (when (projectile-project-p)
    (when (projectile-verify-file "cpanfile")
      (push (concat "-I" (projectile-expand-root "local/lib/perl5")) (nth 1 ad-return-value)))
    (push (concat "-I" (projectile-expand-root "lib")) (nth 1 ad-return-value))
    (push (concat "-I" (projectile-project-root)) (nth 1 ad-return-value))))

;; hook
(require 'helm-perldoc)
(defun my-cperl-mode-hook ()
  "Hook function for `cperl-mode'."
  (helm-perldoc:carton-setup)
  (flymake-mode t)
  (when (boundp 'auto-complete-mode)
    (eval
     '(progn
        (add-to-list 'ac-sources 'ac-source-dictionary)))))
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)

;;; 21-perl.el ends here
