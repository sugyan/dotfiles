;;; Haml

;; haml-mode
;; (auto-install-from-url "https://raw.github.com/nex3/haml-mode/master/haml-mode.el")
(autoload 'haml-mode "haml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
