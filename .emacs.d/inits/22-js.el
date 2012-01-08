;;; JavaScript

;; js2-mode
;; (auto-install-from-url "https://raw.github.com/mooz/js2-mode/master/js2-mode.el")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(eval-after-load "js2-mode"
  '(progn
     ;; my command
     (defun js2-prev-error ()
       (interactive)
       (js2-next-error -1))
     ;; key config
     (define-key js2-mode-map (kbd "C-m") 'newline-and-indent)
     (define-key js2-mode-map (kbd "M-n") 'js2-next-error)
     (define-key js2-mode-map (kbd "M-p") 'js2-prev-error)))

;; hook
(defun my-js2-mode-hook ()
  (set-face-foreground 'js2-function-param-face "SeaGreen3"))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
