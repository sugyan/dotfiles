;;; CSS

;; auto-complete
(eval-when-compile
  (require 'cl)
  (require 'auto-complete-config))
(defvar ac-source-css-property-names
  '((candidates . (loop for property in ac-css-property-alist
                        collect (car property)))))
(defun my-css-mode-hook ()
  (add-to-list 'ac-sources 'ac-source-css-property)
  (add-to-list 'ac-sources 'ac-source-css-property-names))
(add-hook 'css-mode-hook 'my-css-mode-hook)
