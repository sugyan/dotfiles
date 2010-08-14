(global-set-key "\C-h" 'delete-backward-char) ;; 一文字削除
(global-set-key "\C-o" 'other-window)         ;; 別windowへ移動

;; METAキーとALTキー交換
(setq ns-alternate-modifier 'alt)
(setq ns-command-modifier 'meta)

;; C-j と C-m の動作を入れ替える
(keyboard-translate ?\C-j ?\C-m)
(keyboard-translate ?\C-m ?\C-j)

;; 最小化いらない
(global-unset-key (kbd "C-z"))
