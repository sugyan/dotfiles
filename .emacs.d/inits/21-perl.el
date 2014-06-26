;;; 21-perl.el --- perl setting

;;; Commentary:
;; `cperl-mode':
;; cperl-mode from package-install for cperl-indent-subs-specially
;; http://d.hatena.ne.jp/syohex/20120818/1345302707
;; (package-install 'cperl-mode)
;; `helm-perldoc':
;; (package-install 'helm-perldoc)

;;; Code:

(defalias 'perl-mode 'cperl-mode)

(custom-set-variables
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset     -4)
 '(cperl-indent-subs-specially  nil))

(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"  . cperl-mode))
(add-to-list 'auto-mode-alist '("cpanfile" . cperl-mode))
(eval-after-load "cperl-mode"
  '(progn
     (helm-perldoc:setup)
     (cperl-set-style "PerlStyle")
     ;; my flycheck checkers
     (require 'projectile)
     (flycheck-define-checker my-perl
       "A Perl syntax checker using the Perl interpreter."
       :command ("perl" "-w" "-c"
                 (eval (let ((options '()))
                         (when (projectile-project-p)
                           (push (concat "-I" (projectile-project-root)) options)
                           (push (concat "-I" (projectile-expand-root "lib")) options)
                           (when (projectile-verify-file "cpanfile")
                             (push (concat "-I" (projectile-expand-root "local/lib/perl5")) options))
                           options)))
                 source)
       :error-patterns ((error line-start (minimal-match (message)) " at " (file-name) " line " line (or "." (and ", " (zero-or-more not-newline))) line-end))
       :modes (perl-mode cperl-mode)
       :next-checkers (my-perl-perlcritic))
     (flycheck-define-checker my-perl-perlcritic
       "A Perl syntax checker using Perl::Critic."
       :command ("perlcritic" "--no-color" "--verbose" "%f:%l:%c:%s:%m (%e)\n"
                 (option "--severity" flycheck-perlcritic-verbosity flycheck-option-int)
                 source-original)
       :error-patterns ((info    line-start (file-name) ":" line ":" column ":" (any "1")   ":" (message) line-end)
                        (warning line-start (file-name) ":" line ":" column ":" (any "234") ":" (message) line-end)
                        (error   line-start (file-name) ":" line ":" column ":" (any "5")   ":" (message) line-end))
       :modes (cperl-mode perl-mode))
     (add-to-list 'flycheck-checkers 'my-perl)
     (add-to-list 'flycheck-checkers 'my-perl-perlcritic)
     ;; key bind
     (define-key cperl-mode-map (kbd "C-m") 'newline-and-indent)
     (define-key cperl-mode-map (kbd "C-c d") 'helm-perldoc)
     (define-key cperl-mode-map (kbd "C-c h") 'helm-perldoc:history)))

;; hook
(autoload 'helm-perldoc:carton-setup "helm-perldoc" nil t)
(autoload 'flycheck-select-checker "flycheck" nil t)
(defun my-cperl-mode-hook ()
  "Hook function for `cperl-mode'."
  (helm-perldoc:carton-setup)
  (flycheck-select-checker 'my-perl))
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)

;;; 21-perl.el ends here
