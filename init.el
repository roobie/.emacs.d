
;;; BOOTSTRAP
;; Load the files in the .emacs.d directory
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

;; fix font first:
(set-face-attribute 'default nil :height 120 :font "UbuntuMono")

;;; require the applicalble configurations
(require 'pkg)
(require 'misc)
(require 'gui)
(require 'key-bindings)
(require 'auto-complete)
(require 'lisp)
(require 'slime)

;;; Local changes:
;; (create a 'local.el' file with custom code for it to be loaded:
;; NB: you need to (provide 'local) at the bottom of the file.
(when (file-exists-p (expand-file-name "~/.emacs.d/local.el"))
  (require 'local))
