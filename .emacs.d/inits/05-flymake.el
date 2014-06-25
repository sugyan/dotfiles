;;; flymake --- flymake and flycheck

;;; Commentary:
;; Flycheck
;; (package-install 'flycheck)

;;; Code:

;; flymake
(defun display-error-message ()
  "Display error message on echo area."
  (message (get-char-property (point) 'help-echo)))
(defadvice flymake-goto-next-error (after flymake-goto-next-error-display-message activate)
  "Go to next error."
  (display-error-message))
(defadvice flymake-goto-prev-error (after flymake-goto-prev-error-display-message activate)
  "Go to previous error."
  (display-error-message))

(require 'flymake)
(add-to-list 'flymake-allowed-file-name-masks '("\\.t\\'"    flymake-perl-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.psgi\\'" flymake-perl-init))

;; flycheck
(require 'flycheck)
(custom-set-variables
 '(flycheck-disabled-checkers '(perl)))
(global-flycheck-mode t)
(define-key flycheck-mode-map (kbd "M-n") 'flycheck-next-error)
(define-key flycheck-mode-map (kbd "M-p") 'flycheck-previous-error)

;;; 05-flymake.el ends here
