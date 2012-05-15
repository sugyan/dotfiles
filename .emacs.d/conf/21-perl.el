;;; Perl

(require 'flymake)

;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.psgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"  . cperl-mode))
(add-to-list 'flymake-allowed-file-name-masks '("\\.t\\'"    flymake-perl-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.psgi\\'" flymake-perl-init))
(eval-after-load "cperl-mode"
  '(progn
     (cperl-set-style "PerlStyle")
     (define-key cperl-mode-map (kbd "C-m") 'newline-and-indent)
     (define-key cperl-mode-map (kbd "(") nil)
     (define-key cperl-mode-map (kbd "{") nil)
     (define-key cperl-mode-map (kbd "[") nil)
     (define-key cperl-mode-map (kbd "M-n") 'flymake-goto-next-error)
     (define-key cperl-mode-map (kbd "M-p") 'flymake-goto-prev-error)
     (define-key cperl-mode-map (kbd "C-c t") 'perl-run-prove)))
(custom-set-variables
 '(cperl-indent-parens-as-block t)
 '(cperl-close-paren-offset     -4))

;; perl-completion
;; (auto-install-from-url "https://raw.github.com/imakado/perl-completion/master/perl-completion.el")
(autoload 'perl-completion-mode "perl-completion" nil t)
(eval-after-load "perl-completion"
  '(progn
     (defadvice flymake-start-syntax-check-process (around flymake-start-syntax-check-perl-lib-path activate)
       (when perl-completion-mode
         (plcmp-with-set-perl5-lib ad-do-it)))
     (define-key plcmp-mode-map (kbd "M-TAB") nil)
     (define-key plcmp-mode-map (kbd "M-C-o") 'plcmp-cmd-smart-complete)))

;; commands
(require 'vc-git)
(defun perl-run-prove ()
  (interactive)
  (let* ((filename (buffer-file-name))
         (compile-command (concat "cd " (vc-git-root filename) "; prove -v --nocolor " filename)))
    (call-interactively 'compile)))

;; hook
(defun my-cperl-mode-hook ()
  (perl-completion-mode t)
  (flymake-mode t)
  (when (boundp 'auto-complete-mode)
    (defvar ac-source-my-perl-completion
      '((candidates . plcmp-ac-make-cands)))
    (add-to-list 'ac-sources 'ac-source-my-perl-completion)
    (add-to-list 'ac-sources 'ac-source-dictionary)))
(add-hook 'cperl-mode-hook 'my-cperl-mode-hook)
