;; comment-region
(global-set-key "\C-c>" 'comment-region)
(global-set-key "\C-c<" 'uncomment-region)
;; indent
(global-set-key "\C-x\C-i" 'indent-region)
;; shell-command
(global-set-key "\M-s" 'shell-command)

;; 選択範囲を強調表示しない
(setq transient-mark-mode nil)
;; 行の折り返ししない
(setq default-truncate-lines t)
;; indentは半角スペース4つ
(setq-default tab-width 4 indent-tabs-mode nil)
;; 対応する括弧のハイライト
(show-paren-mode t)
;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "C-j") 'ac-complete)
