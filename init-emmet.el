(require-package 'emmet-mode)

(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;; 缩进
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))

(provide 'init-emmet)
