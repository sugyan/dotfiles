;;; Jade

;; jade-mode
;; (auto-install-from-url "https://raw.github.com/brianc/jade-mode/master/sws-mode.el")
;; (auto-install-from-url "https://raw.github.com/brianc/jade-mode/master/jade-mode.el")
(autoload 'sws-mode "sws-mode" nil t)
(autoload 'jade-mode "jade-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
;; auto-complete
(when (boundp 'auto-complete-mode)
  (add-to-list 'ac-modes 'jade-mode))
