;;; environment variables
(eval-when-compile (require 'cl))
;; set environment variable `PATH' from zsh configuration
(setenv "PATH"
        (substring (shell-command-to-string "~/local/bin/zsh -c 'echo $PATH' 2> /dev/null") 0 -1))
;; add PATH to 'exec-path
(loop for path in (reverse (split-string (getenv "PATH") ":"))
      do (add-to-list 'exec-path path))
