;;; 34-web.el --- web-mode setting

;;; Commentary:
;; http://web-mode.org/

;;; Code:

(custom-set-variables
 '(web-mode-markup-indent-offset 2))

(add-to-list 'auto-mode-alist '("\\.tt$"    . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(with-eval-after-load "web-mode"
  (eval
   '(progn
      (defun my-web-mode-hook ()
        "Hook function for `web-mode'."
        (when (equal web-mode-content-type "jsx")
          (flycheck-add-mode 'javascript-eslint 'web-mode)))
      (setq web-mode-content-types
            '(("css"        . "\\.\\(s?css\\|css\\.erb\\)\\'")
              ("javascript" . "\\.\\(js\\|js\\.erb\\)\\'")
              ("json"       . "\\.\\(api\\|json\\|jsonld\\)\\'")
              ("jsx"        . "\\.\\(jsx\\|jsx\\.erb\\)\\'")
              ("xml"        . "\\.xml\\'")
              ("html"       . "."))))))

(add-hook 'web-mode-hook 'my-web-mode-hook)

;;; 34-web.el ends here
