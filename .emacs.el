;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; init loader
(eval-when-compile (require 'cl))
(defgroup init-loader nil
  "init loader"
  :group 'init-loader)
(defcustom init-loader-directory (expand-file-name "~/.emacs.d/inits")
  "default directory"
  :type 'directory
  :group 'init-loader)
(defcustom init-loader-default-regexp "\\(?:^[[:digit:]]\\{2\\}-.*\.elc?\\)$"
  "default filename regexp"
  :type 'regexp
  :group 'init-loader)
(let* ((init-dir init-loader-directory)
       (load-path (cons init-dir load-path))
       (files (directory-files init-dir t))
       (targets (loop for file in (directory-files init-dir t)
                      when (let ((file (file-name-nondirectory file)))
                             (and (string-match init-loader-default-regexp file)
                                  (or (and (string-match "\.el$" file)
                                           (or (not (locate-library (concat file "c")))))
                                      (string-match "\.elc$" file))))
                      collect file into ret
                      finally return (sort ret 'string<))))
  (dolist (target targets)
    (condition-case e
        (load (file-name-sans-extension target))
      (error (message "%s" e)))))

;; auto-install
;; http://www.emacswiki.org/emacs/auto-install.el
;; (auto-install-from-emacswiki "auto-install.el")
(require 'auto-install)

;; benchmark
(defun my-show-init-time ()
  (interactive)
  (message "init time: %d msec"
           (+ (* (- (nth 1 after-init-time) (nth 1 before-init-time)) 1000)
              (/ (- (nth 2 after-init-time) (nth 2 before-init-time)) 1000))))
(add-hook 'after-init-hook 'my-show-init-time)
