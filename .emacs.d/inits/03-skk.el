;;; 03-skk.el --- skk settings

;;; Commentary:
;; $ curl -O http://openlab.ring.gr.jp/skk/maintrunk/ddskk-15.2.tar.gz
;; $ tar zxvf ddskk-15.2.tar.gz
;; $ cd ddskk-15.2
;; $ make install EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs

;;; Code:
(require 'skk-autoloads)
(custom-set-variables
 '(skk-sticky-key ";"))
(define-key global-map (kbd "C-x C-m") 'skk-mode)

;;; 03-skk.el ends here
