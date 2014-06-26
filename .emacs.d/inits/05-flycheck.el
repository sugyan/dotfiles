;;; 05-flycheck.el --- flycheck settings

;;; Commentary:
;; (package-install 'flycheck)

;;; Code:

(require 'flycheck)
(global-flycheck-mode t)
(define-key flycheck-mode-map (kbd "M-n") 'flycheck-next-error)
(define-key flycheck-mode-map (kbd "M-p") 'flycheck-previous-error)

;;; 05-flycheck.el ends here
