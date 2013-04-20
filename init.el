
;;; BOOTSTRAP

(add-to-list 'load-path (expand-file-name "~/.emacs.d"))


;;; INITS
(require 'pkg)
(require 'misc)
(require 'gui)
(require 'key-bindings)
(require 'slime)

;;; Local changes:
(when (file-exists-p (expand-file-name "~/.emacs.d/local.el"))
  (require 'local))
