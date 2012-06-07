;;; font
;; http://www.dafont.com/bitstream-vera-mono.font
;; http://www-old.gnome.org/fonts/
;; http://yumisuke.net/297/emacs/
(create-fontset-from-ascii-font "-apple-Bitstream_Vera_Sans_Mono-medium-normal-normal-*-14-*-*-*-m-0-iso10646-1" nil "BitstreamMarugo")
(set-frame-font "fontset-bitstreammarugo")
(set-fontset-font (frame-parameter nil 'font)
                  'unicode
                  (font-spec :family "Hiragino Maru Gothic ProN" :size 16)
                  nil
                  'append)
