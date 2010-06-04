;; language
(set-language-environment 'utf-8)
;; for emacsclient to work
(server-start)
;; beep音を鳴らさない
(setq ring-bell-function (lambda ()))
;; buffer-nameをuniqueに
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
