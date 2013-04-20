;; ----------------------------------------------------------------------------
;; Enable desired features for all lisp modes
;; ----------------------------------------------------------------------------
(require-package 'rainbow-delimiters)
(require-package 'redshank)
(eval-after-load 'redshank
  '(diminish 'redshank-mode))

(defun lisp-setup ()
  "Enable features useful in any Lisp mode."
  (rainbow-delimiters-mode t)
  (enable-paredit-mode)
  (turn-on-eldoc-mode)
  (redshank-mode))

(add-hook 'lisp-mode-hook 'lisp-setup)
