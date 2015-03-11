;;; cocoa-emacs-01-font.el --- Font setting

;;; Commentary:
;; http://www.dafont.com/bitstream-vera-mono.font
;; http://yumisuke.net/297/emacs/
;; http://sourceforge.jp/projects/macemacsjp/lists/archive/users/2011-January/001686.html
;; http://emacs.g.hatena.ne.jp/sakito/20100127

;;; Code:
(create-fontset-from-ascii-font "Bitstream Vera Sans Mono:pixelsize=13:weight=normal:slant=normal:width=normal:spacing=100:scalable=true" nil "BitstreamMarugo")
(set-fontset-font "fontset-bitstreammarugo"
                  'unicode
                  (font-spec :family "Hiragino Maru Gothic ProN")
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-bitstreammarugo"))
(setq face-font-rescale-alist '(("Hiragino.*" . 1.3)))

;;; cocoa-emacs-01-font.el ends here
