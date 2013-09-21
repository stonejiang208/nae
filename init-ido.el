(ido-mode t)

(require-package 'smex)

;; 更好的补全方式
(after-load 'dired
  (require-package 'ido-better-flex))

(provide 'init-ido)
