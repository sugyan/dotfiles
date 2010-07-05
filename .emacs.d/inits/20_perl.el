;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-close-paren-offset -4
      cperl-indent-parens-as-block t)


;; 対象拡張子の追加
(add-to-list 'auto-mode-alist '("\\.psgi\\'" . perl-mode))
(add-to-list 'auto-mode-alist '("\\.t\\'"    . perl-mode))
(add-to-list 'flymake-allowed-file-name-masks '("\\.psgi\\'" flymake-perl-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.t\\'"    flymake-perl-init))

;; プロジェクトのルートディレクトリを取得
(defvar root-files '("Makefile.PL"))
(defun current-directory ()
  (file-name-directory (expand-file-name (or (buffer-file-name)
                                             default-directory))))
(defun perl-get-root-directory ()
  (loop with i = 0
        with cur-dir = (current-directory)
        while (< i 10)
        do (if (some
                (lambda (file) (find file (directory-files cur-dir) :test 'string=))
                root-files)
               (return cur-dir))
        (setq cur-dir (expand-file-name (concat cur-dir "../")))
        (incf i)
        finally return nil))

;; flymake設定
(defun flymake-perl-init ()
  (let* ((temp-file  (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name)))
         (root-dir   (perl-get-root-directory)))
    (list "perl" (cond (root-dir (list "-I" (concat root-dir "lib")
                                       "-wc" local-file))
                       (t (list "-wc" local-file))))))

;; *.t ファイルに対して prove コマンドで compile する
(defun perl-run-test ()
  (interactive)
  (let ((compile-command
         (cond ((string-match "\\.t$" (buffer-file-name))
                (let ((root-dir (perl-get-root-directory)))
                  (concat (if root-dir
                              (concat "cd " root-dir "; "))
                          "prove --nocolor -l \"" (expand-file-name (buffer-file-name)) "\"")))
               (t (concat "perl -c " (buffer-file-name))))))
    (call-interactively 'compile)))

;; hook
(add-hook 'cperl-mode-hook
          (lambda ()
            (define-key cperl-mode-map (kbd "M-t") 'perl-run-test)
            (define-key cperl-mode-map (kbd "C-m") 'newline-and-indent)
            (flymake-mode)
            (require 'perl-completion) ;; perl-completion
            (perl-completion-mode t)))

;; ttはhtml-modeでごまかす
(add-to-list 'auto-mode-alist '("\\.tt\\'" . html-mode))
;; tmt-mode
(autoload 'tmt-mode "tmt-mode"
  "Major mode for editing Text::MicroTemplate syntax")
(add-to-list 'auto-mode-alist '("\\.mt$" . tmt-mode))
