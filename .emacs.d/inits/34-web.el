;;; 34-web.el --- web-mode setting

;;; Commentary:
;; http://web-mode.org/

;;; Code:
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(with-eval-after-load "web-mode"
  (eval
   '(progn
      (setq web-mode-content-types
            '(("css"        . "\\.\\(s?css\\|css\\.erb\\)\\'")
              ("javascript" . "\\.\\(js\\|js\\.erb\\)\\'")
              ("json"       . "\\.\\(api\\|json\\|jsonld\\)\\'")
              ("jsx"        . "\\.\\(jsx\\|jsx\\.erb\\)\\'")
              ("xml"        . "\\.xml\\'")
              ("html"       . "."))))))

;;; 34-web.el ends here
