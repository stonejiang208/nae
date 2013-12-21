;; 注：ido-better-flex会导致smex补全变慢
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)

(require-package 'ido-ubiquitous)
(ido-ubiquitous-mode t)

(require-package 'smex)

(provide 'init-ido)
