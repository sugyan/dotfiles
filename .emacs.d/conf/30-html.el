;;; HTML

(defun my-html-mode-hook ()
  ;; auto-complete
  (when (boundp 'auto-complete-mode)
    (eval
     '(progn
        (add-to-list 'ac-modes 'html-mode)
        (add-to-list 'ac-sources 'ac-source-dictionary)))))
(add-hook 'html-mode-hook 'my-html-mode-hook)
