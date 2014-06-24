;;; Go
;; (package-install 'go-mode)
;; (package-install 'go-autocomplete)
;; (package-install 'helm-go-package)

(add-hook 'before-save-hook #'gofmt-before-save)

(eval-after-load "go-mode"
  '(progn
     ;; `go-autocomplete` and `go-eldoc` require `gocode` command
     (require 'go-autocomplete)
     (add-hook 'go-mode-hook 'go-eldoc-setup)
     ;; key binding
     (define-key go-mode-map (kbd "C-c d") 'helm-go-package)))

;; use "Show documentation" as 1st action
(eval-after-load "helm-go-package"
  '(progn
     (let* ((actions (helm-attr 'action helm-source-go-package))
            (godoc (nth 2 actions)))
       (delete godoc actions)
       (push godoc actions)
       (helm-attrset 'action actions helm-source-go-package))))
