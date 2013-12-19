
;;; We need package.el
(require 'package)

;;; Standard package repositories
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; We include the org repository for completeness, but don't normally
;; use it.
;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

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
                      yasnippet-bundle
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


;;; DUNNO WHY THIS DOESNT WORK IF NOT IN THIS FILE?!??!
;;; TRIED MOVING IT TO AUTO-COMPLETE.EL BUT TO NO AVAIL
;; http://blog.deadpansincerity.com/2011/05/setting-up-emacs-as-a-javascript-editing-environment-for-fun-and-profit/
(add-to-list 'load-path (directory-of-library "auto-complete"))
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories (concat (directory-of-library "auto-complete") "/dict"))
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

(add-to-list 'load-path (directory-of-library "yasnippet"))
;; Load the library
(require 'yasnippet)
;; error:
;(yas-global-mode t)
;; Load the snippet files themselves
(yas/load-directory (concat (directory-of-library "yasnippet") "/snippets/text-mode"))
;; Let's have snippets in the auto-complete dropdown
(add-to-list 'ac-sources 'ac-source-yasnippet)

(require 'nimrod-mode)

(provide 'pkg)
