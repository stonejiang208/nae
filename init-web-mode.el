(require-package 'web-mode)

(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
(setq web-mode-disable-auto-pairing t)
;; 其实我也不知道这一项有什么用，不过将它设为空后
;; yasnippet在web-mode下展开就会自动缩进了。
(setq web-mode-indent-style nil)

;; html文件也用web-mode来编辑
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(provide 'init-web-mode)
