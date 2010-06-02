(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          (lambda ()
            (require 'perl-completion)
            (perl-completion-mode t)))
(setq auto-mode-alist
      (append '(("\\.psgi\\'" . perl-mode))
              auto-mode-alist))
