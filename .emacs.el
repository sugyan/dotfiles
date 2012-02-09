;; auto-install
;; http://www.emacswiki.org/emacs/auto-install.el
;; (require 'auto-install)
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-from-emacswiki "auto-install.el")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; package.el
;; (auto-install-from-url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el")
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(require 'package)
(package-initialize)
(package-activate 'magit '(1 1 1))

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
    (message "init time: %.3f sec"
             (float-time (time-subtract after-init-time before-init-time)))))

;; set environment variable `PATH' from zsh configuration
(setenv "PATH"
        (substring (shell-command-to-string "~/local/bin/zsh -c 'echo $PATH' 2> /dev/null") 0 -1))
;; add PATH to 'exec-path
(loop for path in (reverse (split-string (getenv "PATH") ":"))
      do (add-to-list 'exec-path path))
