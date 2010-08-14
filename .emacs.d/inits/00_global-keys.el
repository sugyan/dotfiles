;; METAキーとALTキー交換
(setq ns-alternate-modifier 'alt)
(setq ns-command-modifier 'meta)

;; C-j と C-m の動作を入れ替える
(keyboard-translate ?\C-j ?\C-m)
(keyboard-translate ?\C-m ?\C-j)

;; global-set-key
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "M-s") 'shell-command)
(global-set-key (kbd "C-c >") 'comment-region)
(global-set-key (kbd "C-c <") 'uncomment-region)
(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c e b") 'describe-bindings)
(global-set-key (kbd "C-c e f") 'describe-function)
(global-set-key (kbd "C-c e m") 'describe-mode)
(global-set-key (kbd "C-c e v") 'describe-variable)

;; global-unset-key
(global-unset-key (kbd "C-z")) ;; 最小化いらない
