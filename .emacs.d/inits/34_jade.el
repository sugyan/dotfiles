;;; 34_jade.el ---
;; https://github.com/brianc/jade-mode
;; (auto-install-from-url "https://raw.github.com/brianc/jade-mode/master/sws-mode.el")
;; (auto-install-from-url "https://raw.github.com/brianc/jade-mode/master/jade-mode.el")
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
