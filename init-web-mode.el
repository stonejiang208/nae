(require-package 'web-mode)

(defvar my-web-mode-indentation-width 4
  "The number of spaces I prefer for line indentation.")

(setq web-mode-markup-indent-offset my-web-mode-indentation-width
      web-mode-css-indent-offset my-web-mode-indentation-width
      web-mode-code-indent-offset my-web-mode-indentation-width
      web-mode-style-padding my-web-mode-indentation-width
      web-mode-script-padding my-web-mode-indentation-width
      web-mode-block-padding 0)

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

(add-hook 'web-mode-hook
          (lambda ()
            (local-set-key (kbd "RET") 'my-web-mode-newline-and-indent)
            (local-set-key (kbd "TAB") 'my-web-mode-indent)))

(provide 'init-web-mode)
