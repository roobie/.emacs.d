;;; Much of this is complements sanityinc:
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

(global-auto-complete-mode t)
(setq ac-expand-on-auto-complete t)
(setq ac-auto-start t)
(setq ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;;----------------------------------------------------------------------------
;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;;----------------------------------------------------------------------------
(setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)

;; hook AC into completion-at-point
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)


(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))

(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode js2-mode css-mode less-css-mode sql-mode))
  (add-to-list 'ac-modes mode))


;; Exclude very large buffers from dabbrev
(defun buffer-restrict (buf)
  (< (buffer-size buf) (* 4 1024 1024)))

(setq dabbrev-friend-buffer-function 'buffer-restrict)

(provide 'auto-complete)
