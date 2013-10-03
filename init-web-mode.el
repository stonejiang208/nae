(require-package 'web-mode)

(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-disable-auto-pairing t)

;; html文件也用web-mode来编辑
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(provide 'init-web-mode)
