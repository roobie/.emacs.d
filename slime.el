(add-to-list 'load-path "~/src/slime/")  ; your SLIME directory
(setq inferior-lisp-program "clisp")
(require 'slime-autoloads)
(slime-setup)

(load (expand-file-name "~/quicklisp/slime-helper.el"))

(provide 'slime)
