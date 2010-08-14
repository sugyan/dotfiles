;; 編集操作系の設定

;; comment-region
(global-set-key (kbd "C-c >") 'comment-region)
(global-set-key (kbd "C-c <") 'uncomment-region)
;; indent-region
(global-set-key (kbd "C-x C-i") 'indent-region)

;; buffer-nameをuniqueに
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;; 選択範囲をハイライト
(setq transient-mark-mode t)
;; 行の折り返ししない
(setq default-truncate-lines t)
;; indentは半角スペース4つ
(setq-default tab-width 4
              indent-tabs-mode nil)
;; 対応する括弧のハイライト
(show-paren-mode t)

;; isearch中のC-hの動作をdeleteに
(define-key isearch-mode-map (kbd "C-h") 'isearch-del-char)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-show-menu 0.4)
(define-key ac-complete-mode-map (kbd "C-n") 'ac-next)
(define-key ac-complete-mode-map (kbd "C-p") 'ac-previous)
(define-key ac-complete-mode-map (kbd "C-j") 'ac-complete)
