(require 'anything-grep)
;; デフォルトのgrep-commandをackにする
;; (ackのない環境ではどうすれば…？)
(grep-apply-setting 'grep-command "ack ")
