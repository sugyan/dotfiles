;;; 23-ruby.el --- Ruby setting

;;; Commentary:

;;; Code:

(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; ruby-mode
(custom-set-variables
 '(ruby-deep-indent-paren nil)) ;; indent

;; hook
(defun my-ruby-mode-hook ()
    "Hook function for `ruby-mode'."
    )
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;;; 23-ruby.el ends here
