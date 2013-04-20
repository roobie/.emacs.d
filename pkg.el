
;;; We need package.el
(require 'package)

;; Add marmalade to the repo-list
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

 ;; Add in your own as you wish:
(defvar my-packages '(tabbar
                      color-theme-solarized)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(provide 'pkg)
