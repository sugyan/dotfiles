;;; init.el --- init file

;;; Commentary:

;;; Code:

(eval-when-compile (require 'cl))

;; package.el setting
(require 'package)
(add-to-list 'package-archives '("melpa"     . "https://melpa.org/packages/")  t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(package-initialize)
;; install if not installed
(defvar my-package-list
  '(auto-async-byte-compile
    auto-complete
    cperl-mode
    direx
    dockerfile-mode
    exec-path-from-shell
    expand-region
    flycheck
    flycheck-rust
    glsl-mode
    go-autocomplete
    go-eldoc
    go-mode
    golint
    helm
    helm-ag
    helm-descbinds
    helm-go-package
    helm-perldoc
    helm-projectile
    init-loader
    js2-mode
    magit
    markdown-mode
    open-junk-file
    perl6-mode
    powerline
    recentf-ext
    rust-mode
    sass-mode
    shell-pop
    slim-mode
    smooth-scroll
    swift-mode
    toml-mode
    undo-tree
    web-mode
    yaml-mode
    yascroll
    yasnippet))
(let ((not-installed
       (loop for package in my-package-list
             when (not (package-installed-p package))
             collect package)))
  (when not-installed
    (package-refresh-contents)
    (dolist (package not-installed)
      (package-install package))))

;; init loader
(require 'init-loader)
(custom-set-variables
 '(init-loader-show-log-after-init nil))
(init-loader-load)

;; after init
(add-hook 'after-init-hook
          (lambda ()
            ;; show init time
            (message "init time: %.3f sec"
                     (float-time (time-subtract after-init-time before-init-time)))))

;;; init.el ends here
