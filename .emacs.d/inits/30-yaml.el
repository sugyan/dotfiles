;;; Yaml

;; yaml-mode
;; (auto-install-from-url "https://raw.github.com/yoshiki/yaml-mode/master/yaml-mode.el")
(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
