;;; Yaml

;; yaml-mode
;; (auto-install-from-url "https://raw.github.com/yoshiki/yaml-mode/master/yaml-mode.el")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
