;;; JavaScript

;; js2-mode
;; (auto-install-from-url "https://raw.github.com/mooz/js2-mode/master/js2-mode.el")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

;; key config
(define-key js2-mode-map (kbd "C-m") 'newline-and-indent)

;; hook
(defun my-js2-mode-hook ()
  (set-face-foreground 'js2-function-param-face "SeaGreen3"))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
