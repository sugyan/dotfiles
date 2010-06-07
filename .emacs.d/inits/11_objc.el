;; *.h ファイルをobjc-modeで開く
(add-to-list 'auto-mode-alist '("\\.h\\'" . objc-mode))
;; auto-completeにobjc-modeを追加
(add-to-list 'ac-modes 'objc-mode)
;; *.m と *.h 対応するものを切り替える
(setq ff-other-file-alist
      '(("\\.m$" (".h"))
        ("\\.h$" (".m"))))
;; ビルド実行
(defun xcode:buildandrun ()
  (interactive)
  (do-applescript
   (format
    (concat
     "tell application \"Xcode\" to activate \r"
     "tell application \"System Events\" \r"
     "     tell process \"Xcode\" \r"
     "          key code 36 using {command down} \r"
     "    end tell \r"
     "end tell \r"
     ))))
;; キー割り当て
(add-hook 'objc-mode-hook
          (lambda ()
            (define-key objc-mode-map (kbd "C-c o") 'ff-find-other-file)
            (define-key objc-mode-map (kbd "C-c C-c") 'xcode:buildandrun)
            ))
