;;; environment variables

(require 'exec-path-from-shell)
(custom-set-variables
 '(exec-path-from-shell-variables '("PATH" "MANPATH" "GOPATH")))
(setenv "SHELL" (executable-find "zsh"))
(exec-path-from-shell-initialize)
