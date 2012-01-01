;;; Emacs lisp

;; auto-async-byte-compile
;; (auto-install-from-emacswiki "auto-async-byte-compile.el")
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; auto-complete
(require 'auto-complete)
(defun my-emacs-lisp-mode-hook ()
  (interactive)
  (add-to-list 'ac-sources 'ac-source-functions)
  (add-to-list 'ac-sources 'ac-source-variables)
  (add-to-list 'ac-sources 'ac-source-symbols)
  (add-to-list 'ac-sources 'ac-source-features))
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)
