;;; Yasnippet
;; (auto-install-from-url "https://raw.github.com/capitaomorte/yasnippet/master/yasnippet.el")
(require 'yasnippet)
(custom-set-variables
 '(yas/trigger-key  "M-TAB")
 '(yas/snippet-dirs '("~/.emacs.d/etc/snippets")))
(yas/global-mode t)

;; snippet-mode for *.yasnippet
(add-to-list 'auto-mode-alist '("\\.yasnippet$" . snippet-mode))
