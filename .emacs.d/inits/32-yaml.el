;;; Yaml

;; yaml-mode
;; (package-install 'yaml-mode)
(autoload 'yaml-mode "yaml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
