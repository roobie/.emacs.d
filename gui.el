;;; GUI initialization

(set-face-attribute 'default nil :height 120 :font "UbuntuMono")

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(tabbar-mode t)

;;; Theming ;;;
(color-theme-molokai)

(provide 'gui)
