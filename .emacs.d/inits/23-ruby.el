;;; Ruby

(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; ruby-mode
(custom-set-variables
 '(ruby-deep-indent-paren nil)) ;; indent

;; hook
(defun my-ruby-mode-hook ()
  )
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
