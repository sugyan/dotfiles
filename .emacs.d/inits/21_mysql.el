;; mysqlを実行できるようexec-pathに追加しておく
(add-to-list 'exec-path 
             (substring (shell-command-to-string "dirname $(which mysql)") 0 -1))
