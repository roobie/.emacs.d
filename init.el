
;;; BOOTSTRAP
;; Load the files in the .emacs.d directory
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

;;; require the applicalble configurations
(require 'gui) ; fix stuff like menu bar and font
(require 'utils)
(require 'pkg) ; initialize package handling and install missing default packages
(require 'misc) ; misc stuff like preferences and the like
(require 'theming) ; initialize sane themes
(require 'key-bindings) ; manage key bindings
(require 'auto-complete)
(require 'idocfg)
(require 'lisp)
(require 'slime)
(require 'javascript)

;;; Local changes:
;; (create a 'local.el' file with custom code for it to be loaded:
;; NB: you need to (provide 'local) at the bottom of the file.
(when (file-exists-p (expand-file-name "~/.emacs.d/local.el"))
  (require 'local))
