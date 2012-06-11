;;; Emacs lisp

;; auto-async-byte-compile
;; (auto-install-from-emacswiki "auto-async-byte-compile.el")
(autoload 'enable-auto-async-byte-compile-mode "auto-async-byte-compile" nil t)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; auto-complete
(defun my-emacs-lisp-mode-hook ()
  (when (boundp 'auto-complete-mode)
    (eval
     '(progn
        (add-to-list 'ac-sources 'ac-source-functions)
        (add-to-list 'ac-sources 'ac-source-variables)
        (add-to-list 'ac-sources 'ac-source-symbols)
        (add-to-list 'ac-sources 'ac-source-features)))))
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)
