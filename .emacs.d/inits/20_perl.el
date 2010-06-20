;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-close-paren-offset -4
      cperl-indent-parens-as-block t)


;; 対象拡張子の追加
(setq auto-mode-alist
      (append '(("\\.psgi\\'" . perl-mode)
                ("\\.t\\'" . perl-mode))
              auto-mode-alist))

;; *.t ファイルに対して prove コマンドで compile する
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
            (define-key cperl-mode-map (kbd "C-c p") 'perl-run-test)
            (define-key cperl-mode-map (kbd "C-m")   'newline-and-indent)
            (require 'perl-completion) ;; perl-completion
            (perl-completion-mode t)))

;; ttはhtml-modeでごまかす
(add-to-list 'auto-mode-alist '("\\.tt\\'" . html-mode))
;; tmt-mode
(autoload 'tmt-mode "tmt-mode"
  "Major mode for editing Text::MicroTemplate syntax")
(add-to-list 'auto-mode-alist '("\\.mt$" . tmt-mode))
