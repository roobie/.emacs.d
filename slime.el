(add-to-list 'load-path "~/devel/slime/")  ; your SLIME directory
(setq inferior-lisp-program "sbcl")
(require 'slime-autoloads)
(slime-setup)

(load (expand-file-name "~/devel/quicklisp/slime-helper.el"))

(provide 'slime)
