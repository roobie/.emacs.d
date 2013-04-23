;;; These alters the default functionality of the cut and copy commands in Emacs
;;; so that it acts on the current line if no region is visually selected.
(put 'kill-ring-save 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

(put 'kill-region 'interactive-form
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))
;;; End alter default funtionality.

(global-set-key (kbd "C-w") 'kill-whole-line)

(provide 'key-bindings)
