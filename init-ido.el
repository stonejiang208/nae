;; 注：ido-better-flex会导致smex补全变慢

(ido-mode t)
(setq ido-enable-flex-matching t)

(require-package 'smex)

(provide 'init-ido)
