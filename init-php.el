(require-package 'php-mode)

(setq php-mode-coding-style 'Symfony2)

;; 更改php注释类型
(add-hook 'php-mode-hook
          (lambda ()
            (setq php-manual-path "~/.emacs.d/php-manual/")
            (local-unset-key (kbd "C-."))))	;; 避免与global-set-key的冲突

(provide 'init-php)
