(require 'anything-grep)
;; デフォルトのgrep-commandをackにする
;; (ackのない環境ではack.elを使う？ http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=ack.el )
(grep-apply-setting 'grep-command "ack --nocolor --nogroup ")
