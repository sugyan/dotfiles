;;; cocoa-emacs-01-font.el --- Font setting

;;; Commentary:
;; http://www.dafont.com/bitstream-vera-mono.font
;; http://yumisuke.net/297/emacs/
;; http://sourceforge.jp/projects/macemacsjp/lists/archive/users/2011-January/001686.html
;; http://emacs.g.hatena.ne.jp/sakito/20100127

;;; Code:
(create-fontset-from-ascii-font "-*-Bitstream Vera Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1" nil "BitstreamMarugo")
(set-fontset-font (frame-parameter nil 'font)
                  'unicode
                  (font-spec :family "Hiragino Maru Gothic ProN")
                  nil
                  'append)
(setq face-font-rescale-alist '(("Hiragino.*" . 1.2)))

;;; cocoa-emacs-01-font.el ends here
