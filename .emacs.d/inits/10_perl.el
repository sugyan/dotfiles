;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-close-paren-offset -4
      cperl-indent-parens-as-block t)

;; perl-completion
(add-hook 'cperl-mode-hook
          (lambda ()
            (require 'perl-completion)
            (perl-completion-mode t)))

;; keybind
(define-key cperl-mode-map (kbd "C-m") 'newline-and-indent)

;; 対象拡張子の追加
(setq auto-mode-alist
      (append '(("\\.psgi\\'" . perl-mode)
                ("\\.t\\'" . perl-mode))
              auto-mode-alist))

;; tmt-mode
(autoload 'tmt-mode "tmt-mode"
  "Major mode for editing Text::MicroTemplate syntax")
(add-to-list 'auto-mode-alist '("\\.mt$" . tmt-mode))
