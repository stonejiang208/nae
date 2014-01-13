(nae-require-package 'emmet-mode)

;; 不预览
(setq emmet-preview-default nil)

;; 展开后高亮显示的时间
(setq emmet-insert-flash-time 0.1)

;; 缩进
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(provide 'nae-emmet)
