;; flymake
;; node-jslint (https://github.com/reid/node-jslint)
;; "npm install jslint -g"
;; exec-path, process-environment にPATH追加する必要あり
(require 'flymake)
(add-to-list 'flymake-allowed-file-name-masks '("\\.js\\'" flymake-js-init))
(defun flymake-js-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "jslint" (list "--no-es5" local-file))))
(defun flymake-js-load ()
  (interactive)
  (setq flymake-err-line-patterns
        (cons '("^ *[[:digit:]] \\([[:digit:]]+\\),\\([[:digit:]]+\\)\: \\(.+\\)$"
                nil 1 2 3)
              flymake-err-line-patterns))
  (flymake-mode t))

(add-hook 'js-mode-hook
          (lambda ()
            (flymake-js-load)
            (define-key js-mode-map (kbd "C-m") 'newline-and-indent)
            (define-key js-mode-map (kbd ";")   nil) ; stickyと競合したので
            ))
