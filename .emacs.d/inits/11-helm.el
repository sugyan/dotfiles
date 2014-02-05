;;; helm
;; (package-install 'helm)

(require 'helm)
(require 'helm-files)
;; customize
(custom-set-variables
 '(helm-truncate-lines t)
 '(helm-delete-minibuffer-contents-from-point t))

;; key settings
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'helm-ff-backspace)
(define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)

(global-set-key (kbd "C-q") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z a") 'helm-apropos)
(global-set-key (kbd "C-z r") 'helm-resume)
(global-set-key (kbd "C-z o") 'helm-occur)
(global-set-key (kbd "C-z g") 'helm-ag)
