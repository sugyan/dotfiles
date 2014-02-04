;;; Magit
;; (package-install 'magit)

;; color
(eval-after-load 'magit
  '(progn
     (set-face-background 'magit-item-highlight "#202020")
     (set-face-foreground 'magit-diff-add "#40ff40")
     (set-face-foreground 'magit-diff-del "#ff4040")
     (set-face-foreground 'magit-diff-file-header "#4040ff")))
