;; 以下のコマンドでterminfoを生成しておく
;; tic -o $HOME/.terminfo path/to/Emacs.app/Contents/Resources/etc/e/eterm-color.ti
(require 'multi-term)

;; Macの場合 utf-8-hfs にすべき？
(setq locale-coding-system 'utf-8)

;; shell-command
(global-set-key "\M-s" 'multi-term-next)
(global-set-key "\M-S" 'multi-term-prev)

;; term に奪われたくないキー
(add-to-list 'term-unbind-key-list '"C-o")

;; term 内での文字削除、ペーストを有効にする
(add-hook 'term-mode-hook
          '(lambda ()
             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
             (define-key term-raw-map (kbd "C-r") 'term-send-reverse-search-history)
             (define-key term-raw-map (kbd "C-y") 'term-paste)
             (define-key term-raw-map  (kbd "ESC ESC") 'term-line-mode)
             (define-key term-mode-map (kbd "ESC ESC") 'term-char-mode)
             ))
