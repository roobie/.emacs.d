;;; BOOTSTRAP
;;; Define the list of files to load
(defvar *load-files* '(gui
                       utils
                       pkg
                       misc
                       theming
                       key-bindings
                       auto-complete
                       yas
                       idocfg
                       lisp
                       slime
                       javascript
                       go
                       nimrod
                       html
                       ))

;; Load the files in the .emacs.d directory
(defvar *base-path* (expand-file-name "~/.emacs.d"))
(dolist (file *load-files*)
  (load (format "%s/%s" *base-path* file))
  (require file))

;;; Local changes:
;; (create a 'local.el' file with custom code for it to be loaded:
;; NB: you need to (provide 'local) at the bottom of the file.
(when (file-exists-p (expand-file-name "~/.emacs.d/local.el"))
  (progn
    (load (expand-file-name "~/.emacs.d/local.el"))
    (require 'local)))

(require 'server)
(unless (server-running-p)
  (server-start))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
