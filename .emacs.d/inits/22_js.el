;; flymake設定
(require 'flymake)
(add-to-list 'flymake-allowed-file-name-masks '("\\.js\\'" flymake-js-init))
(defcustom flymake-js-detect-trailing-comma t nil :type 'boolean)
;; TODO 何度も読むとおかしくなる？
(defvar flymake-js-err-line-patterns '(("^\\(.+\\)\:\\([0-9]+\\)\: \\(.+Error\:.+\\)$" 1 2 nil 3)))
(when flymake-js-detect-trailing-comma
  (setq flymake-js-err-line-patterns (append flymake-js-err-line-patterns
                                             '(("^\\(.+\\)\:\\([0-9]+\\)\: \\(strict warning: trailing comma.+\\)\:$" 1 2 nil 3)))))
(defun flymake-js-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "js" (list "-s" local-file))))
(defun flymake-js-load ()
  (interactive)
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
    (setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)
  (setq flymake-err-line-patterns flymake-js-err-line-patterns)
  (flymake-mode t))
(add-hook 'js-mode-hook '(lambda () (flymake-js-load)))
