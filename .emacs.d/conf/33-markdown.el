;;; Markdown

;; markdown-mode
;; (package-install 'markdown-mode)
;; to install markdown command (Markdown.pl) :
;; $ cpanm Text::Markdown
(autoload 'markdown-mode "markdown-mode" nil t)
(custom-set-variables
 '(markdown-command                "Markdown.pl")
 '(markdown-command-needs-filename t))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
