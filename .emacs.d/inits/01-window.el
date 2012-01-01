;;; window

;; size
(setq initial-frame-alist
      '((width . 177) (height . 49)))	; maximum size

;; split
(split-window-horizontally)

;; color
(set-background-color "black")
(set-foreground-color "white")

;; hide scroll-bar
(scroll-bar-mode nil)
