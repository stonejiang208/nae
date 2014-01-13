(nae-require-package 'web-mode)

(defun nae-set-web-mode-indentation (indentation)
  (setq web-mode-markup-indent-offset indentation
        web-mode-css-indent-offset indentation
        web-mode-code-indent-offset indentation
        web-mode-style-padding indentation
        web-mode-script-padding indentation))

(nae-set-web-mode-indentation 2)

(setq web-mode-block-padding 0)
(setq web-mode-disable-auto-pairing t)
(setq web-mode-indent-style 2)

;; html文件也用web-mode来编辑
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (memq nae-php-mode-coding-style '(codeigniter))
              (yas-activate-extra-mode (intern (concat (symbol-name nae-php-mode-coding-style) "-mode"))))))

(provide 'nae-web-mode)
