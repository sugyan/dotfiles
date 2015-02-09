;;; 11-helm.el --- helm settings
;;; Commentary:
;; (package-install 'helm)
(require 'helm)

;;; Code:

(custom-set-variables
 '(helm-truncate-lines t)
 '(helm-buffer-max-length 35)
 '(helm-delete-minibuffer-contents-from-point t)
 '(helm-ff-skip-boring-files t)
 '(helm-boring-file-regexp-list '("~$" "\\.elc$"))
 '(helm-split-window-default-side 'right)
 '(helm-projectile-fuzzy-match nil))

;; set helm-command-prefix-key to "C-z"
(progn
  (require 'helm-config)
  (global-unset-key (kbd "C-z"))
  (custom-set-variables
   '(helm-command-prefix-key "C-z")))

;; key settings
(global-set-key (kbd "C-q") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(define-key helm-command-map (kbd "d") 'helm-descbinds)
(define-key helm-command-map (kbd "g") 'helm-ag)
(define-key helm-command-map (kbd "o") 'helm-occur)
(define-key helm-command-map (kbd "p") 'helm-projectile)
(define-key helm-command-map (kbd "y") 'yas/insert-snippet)
(define-key helm-command-map (kbd "M-/") 'helm-dabbrev)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(with-eval-after-load "helm-files"
  (eval
   '(progn
      ;; don't use presel for find-files
      (defadvice helm-find-files-1 (before helm-find-files-1-remove-presel activate)
        (ad-set-arg 1 nil))
      (define-key helm-find-files-map (kbd "C-h") nil)
      (define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action))))

;;; 11-helm.el ends here
