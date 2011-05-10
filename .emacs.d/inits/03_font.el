;; http://sakito.jp/emacs/emacs23.html#id15
(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
(set-fontset-font "fontset-menlokakugo"
                  'unicode
                  (font-spec :family "Hiragino Kaku Gothic ProN" :size 16)
                  nil
                  'append)

;; http://d.hatena.ne.jp/os0x/20100822/1282495059
;; http://www.levien.com/type/myfonts/inconsolata.html
;; http://macemacsjp.sourceforge.jp/index.php?MacFontSetting#h3b01bb4
(create-fontset-from-ascii-font "-apple-Inconsolata-medium-normal-normal-*-16-*-*-*-m-0-iso10646-1" nil "inconsolatekakugo")
(set-fontset-font "fontset-inconsolatekakugo"
                  'unicode
                  (font-spec :family "Hiragino Kaku Gothic ProN" :size 16)
                  nil
                  'append)

;; neta
;; http://d.hatena.ne.jp/masaking/20080720/1216543178
(create-fontset-from-ascii-font "-apple-aquafont-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1" nil "aqua")
(set-fontset-font "fontset-aqua"
                  'unicode
                  (font-spec :family "aquafont" :size 18)
                  nil
                  'append)

(create-fontset-from-ascii-font "-apple-HuiFont-medium-normal-normal-*-18-*-*-*-p-0-iso10646-1" nil "Hui")
(set-fontset-font "fontset-Hui"
                  'unicode
                  (font-spec :family "HuiFont" :size 18)
                  nil
                  'append)

(set-frame-font "fontset-inconsolatekakugo")
;; (set-frame-font "fontset-menlokakugo")
;; (set-frame-font "fontset-aqua")
;; (set-frame-font "fontset-Hui")
