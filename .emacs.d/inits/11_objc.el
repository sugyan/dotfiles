;; *.h ファイルをobjc-modeで開く
(add-to-list 'auto-mode-alist '("\\.h\\'" . objc-mode))
;; auto-completeにobjc-modeを追加
(add-to-list 'ac-modes 'objc-mode)
;; *.m と *.h 対応するものを切り替える
(setq ff-other-file-alist
      '(("\\.m$" (".h"))
        ("\\.h$" (".m"))))
;; indent設定
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "cc-mode")))
;; xcodeに切り替える
(defun xcode ()
  (interactive)
  (do-applescript
   (format
    (concat "tell application \"Xcode\" to activate"))))

;; キー割り当て
(add-hook 'objc-mode-hook
          (lambda ()
            (define-key objc-mode-map (kbd "C-m")     'newline-and-indent)
            (define-key objc-mode-map (kbd "C-c o")   'ff-find-other-file)
            (define-key objc-mode-map (kbd "C-c C-c") 'compile)
            (define-key objc-mode-map (kbd "C-c RET") 'xcode)
            (c-subword-mode)))
