;;; Ruby

(custom-set-variables
 '(ruby-deep-indent-paren nil)) ;; indent

;; ruby-electric.el
;; (auto-install-from-url "https://raw.github.com/ruby/ruby/trunk/misc/ruby-electric.el")
(autoload 'ruby-electric-mode "ruby-electric" nil t)

;; hook
(defun my-ruby-mode-hook ()
  (ruby-electric-mode t))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
