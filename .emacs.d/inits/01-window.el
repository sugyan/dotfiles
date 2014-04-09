;;; window
(custom-set-variables
 '(menu-bar-mode nil))

;; color
(set-background-color "black")
(set-foreground-color "white")

;; scroll
;; use smooth-scroll, yascroll
(require 'smooth-scroll)
(require 'yascroll)
(smooth-scroll-mode t)
(global-yascroll-bar-mode t)
(custom-set-variables
 '(smooth-scroll/vscroll-step-size 10))
(custom-set-faces
 '(yascroll:thumb-fringe ((t (:background "slate gray" :foreground "slate gray")))))

;; mode line
(require 'powerline)
(powerline-default-theme)
(custom-set-faces
 '(mode-line ((t (:background "LightGreen" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(powerline-active1 ((t (:background "LightPink2" :inherit mode-line))))
 '(powerline-active2 ((t (:background "LightSkyBlue3" :inherit mode-line)))))
