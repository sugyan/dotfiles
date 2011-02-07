;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/apel")
(add-to-list 'load-path "~/.emacs.d/elisp/emu")
(add-to-list 'load-path "~/.emacs.d/elisp/skk")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; init-loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
;; デフォルトで"~/.emacs.d/inits"以下のファイルをロードする
(require 'init-loader)
(init-loader-load)

;; auto-install
;; http://www.emacswiki.org/emacs/auto-install.el
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(vc-follow-symlinks t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
