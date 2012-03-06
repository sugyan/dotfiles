;;; Flymake
(defun display-error-message ()
  (message (get-char-property (point) 'help-echo)))
(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message activate)
  (display-error-message))
(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message activate)
  (display-error-message))
