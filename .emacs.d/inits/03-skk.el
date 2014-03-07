;;; SKK
;; $ curl -O http://openlab.ring.gr.jp/skk/maintrunk/ddskk-15.1.tar.gz
;; $ tar zxvf ddskk-15.1.tar.gz
;; $ cd ddskk-15.1
;; $ make install EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs

(require 'skk-autoloads)
(custom-set-variables
 '(skk-sticky-key ";"))
(define-key global-map (kbd "C-x C-m") 'skk-mode)
