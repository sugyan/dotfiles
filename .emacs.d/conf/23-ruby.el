;;; Ruby

;; ruby-mode
;; https://raw.github.com/ruby/ruby/v1_9_3_194/misc/ruby-mode.el

(custom-set-variables
 '(ruby-deep-indent-paren nil)) ;; indent

;; hook
(defun my-ruby-mode-hook ()
  )
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)
