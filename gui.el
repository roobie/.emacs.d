;;; GUI initialization

(set-frame-font "Consolas-11")

(setq inhibit-startup-message t) ;; no splash screen

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)
(show-paren-mode 1)

(load-theme 'solarized t)

(provide 'gui)
