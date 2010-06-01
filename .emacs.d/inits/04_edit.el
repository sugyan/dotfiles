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
