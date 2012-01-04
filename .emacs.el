;; benchmark
(defun my-show-init-time ()
  (interactive)
  (message "init time: %d msec"
           (+ (* (- (nth 1 after-init-time) (nth 1 before-init-time)) 1000)
              (/ (- (nth 2 after-init-time) (nth 2 before-init-time)) 1000))))
(add-hook 'after-init-hook 'my-show-init-time)

;; load-path
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;; auto-install
;; http://www.emacswiki.org/emacs/auto-install.el
;; (auto-install-from-emacswiki "auto-install.el")
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)

;;; init-loader
;; (auto-install-from-url "http://coderepos.org/share/export/39091/lang/elisp/init-loader/init-loader.el")
(require 'init-loader)
;; loads hoge.elc (if exists) or hoge.el
(eval-when-compile (require 'cl))
(flet ((init-loader--re-load-files (re dir &optional sort)
  (loop for el in (directory-files dir t)
        when (and (string-match re (file-name-nondirectory el))
                  (or (string-match "elc$" el)
                      (and (string-match "el$" el)
                           (not (locate-library (concat el "c"))))))
        collect (file-name-nondirectory el) into ret
        finally return (if sort (sort ret 'string<) ret))))
  (init-loader-load))
