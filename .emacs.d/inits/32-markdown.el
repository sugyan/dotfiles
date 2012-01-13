;;; Markdown

;; markdown-mode
;; (auto-install-from-url "http://jblevins.org/projects/markdown-mode/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
