;; http://d.hatena.ne.jp/IMAKADO/20080724/1216882563
(require 'anything-c-moccur)
;; スペース区切りで検索可能に
(setq moccur-split-word t)
(setq anything-c-moccur-enable-initial-pattern t ;; カーソル位置の語を最初のパターンに
      anything-c-moccur-enable-auto-look-flag t  ;; 現在選択中の候補の位置を別のbufferに表示する
      )
(global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-s") 'anything-c-moccur-isearch-forward)
(global-set-key (kbd "C-M-r") 'anything-c-moccur-isearch-backward)
