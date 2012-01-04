;;; Yasnippet
;; (auto-install-from-url "https://raw.github.com/capitaomorte/yasnippet/master/yasnippet.el")
(require 'yasnippet)
(setq-default yas/snippet-dirs '("~/.emacs.d/inits/etc/snippets"))
(yas/global-mode t)
