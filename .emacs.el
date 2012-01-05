;; auto-install
;; http://www.emacswiki.org/emacs/auto-install.el
;; (require 'auto-install)
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-from-emacswiki "auto-install.el")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; my init loader
(eval-when-compile (require 'cl))
(defvar init-loader-directory (expand-file-name "~/.emacs.d/inits"))
(defvar init-loader-regexp "\\(?:^[[:digit:]]\\{2\\}-.*\.elc?\\)$")
(defun init-loader-load (dir regexp)
  (let* ((load-path (cons dir load-path))
         (targets (loop for file in (directory-files dir t)
                        when (and (string-match regexp (file-name-nondirectory file))
                                  (or (not (locate-library (concat file "c")))
                                      (string-match "\.elc$" file)))
                        collect file into ret
                        finally return (sort ret 'string<))))
    (dolist (target targets)
      (condition-case e
          (let* ((before (current-time))
                 (result (load (file-name-sans-extension target) nil t))
                 (after  (current-time))
                 (time (+ (* (- (nth 1 after) (nth 1 before)) 1000)
                          (/ (- (nth 2 after) (nth 2 before)) 1000))))
            (message "loaded %s: %d msec" target time))
        (error (message "%s" e))))))
(init-loader-load init-loader-directory init-loader-regexp)

;; show init time
(add-hook 'after-init-hook
  (lambda ()
    (message "init time: %d msec"
             (+ (* (- (nth 1 after-init-time) (nth 1 before-init-time)) 1000)
                (/ (- (nth 2 after-init-time) (nth 2 before-init-time)) 1000)))))
