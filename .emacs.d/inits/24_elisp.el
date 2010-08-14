;; elisp-mode の設定
(defun my-elisp-mode-hook ()
  (define-key emacs-lisp-mode-map (kbd "C-c C-v") 'describe-variable)
  (define-key emacs-lisp-mode-map (kbd "C-c C-f") 'describe-function))
(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)
