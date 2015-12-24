;;; cocoa-emacs-00-env.el --- environment variables
;;; Commentary:

;;; Code:
(require 'exec-path-from-shell)
(custom-set-variables
 '(exec-path-from-shell-variables '("PATH" "MANPATH" "GOPATH")))
(setenv "SHELL" (executable-find "zsh"))
(exec-path-from-shell-initialize)

;;; cocoa-emacs-00-env.el ends here
