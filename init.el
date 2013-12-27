
;;; BOOTSTRAP

(defvar *load-files* '(gui
                       utils
                       pkg
                       misc
                       theming
                       key-bindings
                       auto-complete
                       idocfg
                       lisp
                       slime
                       javascript
                       go
                       go-autocomplete
                       ;auto-complete-config
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

