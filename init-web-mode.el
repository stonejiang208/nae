(require-package 'web-mode)

(defun my-set-web-mode-indentation (indentation)
  (setq web-mode-markup-indent-offset indentation
        web-mode-css-indent-offset indentation
        web-mode-code-indent-offset indentation
        web-mode-style-padding indentation
        web-mode-script-padding indentation))

(my-set-web-mode-indentation 2)

(setq web-mode-block-padding 0)
(setq web-mode-disable-auto-pairing t)
(setq web-mode-indent-style 2)

;; html文件也用web-mode来编辑
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(defun my-web-mode-newline-and-indent ()
  "Inserts a newline character then indents the new line just
like the previous line"
  (interactive)
  (delete-horizontal-space t)
  (newline)
  (indent-relative-maybe))

(defun my-web-mode-indent ()
  "When point is on leading white-space of a non-empty line, the
line is indented `my-indentation-width' spaces. If point is at
the beginning of an empty line, inserts `my-indentation-width'
spaces."
  (interactive)
  (insert (if indent-tabs-mode
              (concat (make-string (/ my-web-mode-indentation-width tab-width) ?\t)
                      (make-string (% my-web-mode-indentation-width tab-width) ? ))
            (make-string my-web-mode-indentation-width ? ))))

;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "RET") 'my-web-mode-newline-and-indent)
;;             (local-set-key (kbd "TAB") 'my-web-mode-indent)))

(provide 'init-web-mode)
