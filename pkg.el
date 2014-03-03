
;;; We need package.el
(require 'package)

;;; Standard package repositories
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;; Also use Melpa for most packages
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

;; But don't take Melpa versions of certain packages
(setq package-filter-function
      (lambda (package version archive)
        (and
         (not (memq package '(eieio)))
         (or (not (string-equal archive "melpa"))
             (not (memq package '(slime)))))))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(tabbar
                      starter-kit
                      starter-kit-js
                      starter-kit-lisp
                      move-text
                      mic-paren
                      paredit
                      color-theme
                      color-theme-molokai
                      auto-complete
                      elisp-slime-nav
                      lively
                      diminish
                      pretty-mode
                      auto-compile
                      hl-sexp
                      eldoc-eval
                      magit
                      clojure-mode
                      clojure-test-mode
                      elein
                      nrepl
                      slamhound
                      ac-nrepl
                      rainbow-delimiters
                      dired+
                      whole-line-or-region
                      mic-paren
                      ace-jump-mode
                      ido-ubiquitous
                      idomenu
                      mmm-mode
                      smex
                      js2-mode
                      json
                      js-comint
                      flymake-jslint
                      yasnippet
                      nimrod-mode
                      geiser
                      d-mode
                      redshank
                      go-mode
                      go-errcheck
                      company-go)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(require 'nimrod-mode)

(provide 'pkg)
