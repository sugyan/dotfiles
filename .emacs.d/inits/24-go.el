;;; 24-go.el --- Go setting

;;; Commentary:
;; (package-install 'go-mode)
;; (package-install 'go-autocomplete)
;; (package-install 'helm-go-package)
;; `gocode': (for go-autocomplete)
;; $ go get -u github.com/nsf/gocode
;; `golint':
;; $ go get -u github.com/golang/lint/golint

;;; Code:

(add-hook 'before-save-hook #'gofmt-before-save)

(with-eval-after-load "go-mode"
  (eval
   '(progn
      ;; `go-autocomplete` and `go-eldoc` require `gocode` command
      (require 'go-autocomplete)
      (add-hook 'go-mode-hook 'go-eldoc-setup)
      ;; key binding
      (define-key go-mode-map (kbd "C-c d") 'helm-go-package))))

;; use "Show documentation" as 1st action
(with-eval-after-load 'helm-go-package
  (eval
  '(progn
     (let* ((actions (helm-attr 'action helm-source-go-package))
            (godoc (nth 2 actions)))
       (delete godoc actions)
       (push godoc actions)
       (helm-attrset 'action actions helm-source-go-package)))))

;;; 24-go.el ends here
