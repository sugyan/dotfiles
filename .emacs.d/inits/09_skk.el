;; skk 設定

;;;; apel
;; curl -O "http://kanji.zinbun.kyoto-u.ac.jp/~tomo/lemi/dist/apel/apel-10.8.tar.gz"
;; tar zxvf apel-10.8.tar.gz
;; cd apel-10.8
;; make install EMACS=$HOME/Applications/Emacs.app/Contents/MacOS/Emacs PREFIX=$HOME/local LISPDIR=$HOME/.emacs.d/elisp VERSION_SPECIFIC_LISPDIR=$HOME/.emacs.d/elisp

;;;; skk
;; curl -O "http://openlab.ring.gr.jp/skk/maintrunk/ddskk-14.0.91.tar.gz"
;; tar zxvf ddskk-14.0.91.tar.gz
;; cd ddskk-14.0.91
;; emacsclient SKK-CFG
;; ;; 以下を追記
;; ;; (setq SKK_DATADIR "~/local/etc/skk")
;; ;; (setq SKK_INFODIR "~/local/info")
;; ;; (setq SKK_LISPDIR "~/.emacs.d/elisp/skk")
;; ;; (setq SKK_SET_JISYO t)
;; ;; (add-to-list 'load-path "~/local/elisp/apel")
;; ;; (add-to-list 'load-path "~/local/elisp/emu")
;; make install EMACS=$HOME/Applications/Emacs.app/Contents/MacOS/Emacs
(require 'skk-autoloads)
(global-set-key (kbd "C-x C-m") 'skk-mode)
(setq skk-large-jisyo "~/.emacs.d/skk/SKK-JISYO.L")
(setq skk-tut-file "~/local/etc/skk/SKK.tut")