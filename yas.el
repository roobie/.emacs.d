(add-to-list 'load-path (directory-of-library "yasnippet"))
;; Load the library
(require 'yasnippet)
;; Load the snippet files themselves
(yas/load-directory (concat (directory-of-library "yasnippet") "/snippets/text-mode"))
;; Let's have snippets in the auto-complete dropdown
(add-to-list 'ac-sources 'ac-source-yasnippet)

(yas-global-mode 1)

(provide 'yas)
