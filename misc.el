
(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))

;;; https://github.com/ralph-moeritz/.emacs.d/
(setq-default indent-tabs-mode nil) ;; no tabs please
(prefer-coding-system 'utf-8) ;; prefer utf-8
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; auto-fill in text-mode
(put 'erase-buffer 'disabled nil) ;; enable erase-buffer
(winner-mode 1) ;; winner mode FTW
(put 'upcase-region 'disabled nil) ;; enable upcase-region
(setq-default fill-column 79) ;; fill at col 79

;;----------------------------------------------------------------------------
;; Some basic preferences (inspired by https://github.com/purcell/emacs.d)
;;----------------------------------------------------------------------------
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 bookmark-default-file "~/.emacs.d/.bookmarks.el"
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)

(fset 'yes-or-no-p 'y-or-n-p)

;;; Automatically load changes in file from disc.
(global-auto-revert-mode t)

(paren-activate)     ; activating mic-paren


(transient-mark-mode t)


;;----------------------------------------------------------------------------
;; Rectangle selections, and overwrite text when the selection is active
;;----------------------------------------------------------------------------
(cua-selection-mode t)                  ; for rectangles, CUA is nice

(move-text-default-bindings)

;;----------------------------------------------------------------------------
;; Fix backward-up-list to understand quotes, see http://bit.ly/h7mdIL
;;----------------------------------------------------------------------------
(defun backward-up-sexp (arg)
  "Jump up to the start of the ARG'th enclosing sexp."
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp) ; C-M-u, C-M-up


;;----------------------------------------------------------------------------
;; Cut/copy the current line if no region is active
;;----------------------------------------------------------------------------
(whole-line-or-region-mode t)
(diminish 'whole-line-or-region-mode)
(make-variable-buffer-local 'whole-line-or-region-mode)

(provide 'misc)
