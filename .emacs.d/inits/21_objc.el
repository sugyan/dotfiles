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

(defvar objc-root-files '("main.m"))
(defun current-directory ()
  (file-name-directory (expand-file-name (or (buffer-file-name)
                                             default-directory))))
(defun objc-get-root-directory ()
  (loop with i = 0
        with cur-dir = (current-directory)
        while (< i 10)
        do (if (some
                (lambda (file) (find file (directory-files cur-dir) :test 'string=))
                objc-root-files)
               (return cur-dir))
        (setq cur-dir (expand-file-name (concat cur-dir "../")))
        (incf i)
        finally return nil))
;; compile
(defun objc-xcodebuild ()
  (interactive)
  (let ((compile-command
         (let ((root-dir (objc-get-root-directory)))
           (concat (if root-dir
                       (concat "cd " root-dir "; "))
                   "xcodebuild -sdk iphonesimulator4.0 -configuration Debug"))))
    (call-interactively 'compile)))

;; hook
(defun my-objc-mode-hook ()
  (define-key objc-mode-map (kbd "C-m")   'newline-and-indent)
  (define-key objc-mode-map (kbd "C-c o") 'ff-find-other-file)
  (define-key objc-mode-map (kbd "C-c c") 'objc-xcodebuild)
  (define-key objc-mode-map (kbd "C-c x") 'xcode)
  (c-subword-mode))
(add-hook 'objc-mode-hook 'my-objc-mode-hook)
