;;; Haml

;; haml-mode
;; (package-install 'haml-mode)
(autoload 'haml-mode "haml-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
