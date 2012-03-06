;;; SKK
;; $ curl -O http://openlab.ring.gr.jp/skk/maintrunk/ddskk-14.4.tar.gz
;; $ tar zxvf ddskk-14.4.tar.gz
;; $ cd ddskk-14.4
;; $ make install EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs

(require 'skk-autoloads)
(custom-set-variables
 '(skk-sticky-key ";"))
(define-key global-map (kbd "C-x C-m") 'skk-mode)
