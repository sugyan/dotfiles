;; auto-install
;; http://www.emacswiki.org/emacs/auto-install.el
;; (require 'auto-install)
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-from-emacswiki "auto-install.el")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; init loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(eval-when-compile (require 'cl))
(defvar init-loader-directory (expand-file-name "~/.emacs.d/inits"))
(defvar init-loader-regexp "\\(?:^[[:digit:]]\\{2\\}-.*\.elc?\\)$")
(defun init-loader-files (dir regexp)
  (loop for file in (directory-files dir t)
        when (and (string-match regexp (file-name-nondirectory file))
                  (or (not (locate-library (concat file "c")))
                      (string-match "\.elc$" file)))
        collect file into ret
        finally return (sort ret 'string<)))
(defun init-loader-load (dir regexp)
  (let ((load-path (cons dir load-path))
        (targets (init-loader-files dir regexp)))
    (dolist (target targets)
      (condition-case e
          (load (file-name-sans-extension target) nil t)
        (error (message "load error: %s - %s" target e))))))
(init-loader-load init-loader-directory init-loader-regexp)

;; show init time
(add-hook 'after-init-hook
  (lambda ()
    (message "init time: %d msec"
             (+ (* (- (nth 1 after-init-time) (nth 1 before-init-time)) 1000)
                (/ (- (nth 2 after-init-time) (nth 2 before-init-time)) 1000)))))

;; set environment variable `PATH' from zsh configuration
(setenv "PATH"
        (substring (shell-command-to-string "~/local/bin/zsh -c 'echo $PATH' 2> /dev/null") 0 -1))
;; add PATH to 'exec-path
(loop for path in (reverse (split-string (getenv "PATH") ":"))
      do (add-to-list 'exec-path path))
