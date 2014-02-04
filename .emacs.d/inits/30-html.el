;;; HTML

(defun my-html-mode-hook ()
  ;; auto-complete
  (when (boundp 'auto-complete-mode)
    (eval
     '(progn
        (when (functionp 'smartchr)
          (define-key html-mode-map (kbd "%") (smartchr '("%" "[% `!!' %]"))))
        (add-to-list 'ac-modes 'html-mode)
        (add-to-list 'ac-sources 'ac-source-dictionary)))))
(add-hook 'html-mode-hook 'my-html-mode-hook)

;; html-mode for *.tt files
(add-to-list 'auto-mode-alist '("\\.tt$" . html-mode))
