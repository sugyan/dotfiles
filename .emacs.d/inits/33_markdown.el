;;; 33_markdown.el --- 
;; http://jblevins.org/projects/markdown-mode/
;; (auto-install-from-url "http://jblevins.org/projects/markdown-mode/markdown-mode.el")

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(defun my-markdown-mode-hook ()
  "markdown-mode-hook"
  (setq markdown-command "Markdown.pl"))
(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)
