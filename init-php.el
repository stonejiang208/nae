(require-package 'php-mode)

(setq php-mode-coding-style 'symfony2)

;; 更改php注释类型
(add-hook 'php-mode-hook
          (lambda ()
            (setq php-manual-path "~/.emacs.d/php-manual/")
              ))

(provide 'init-php)
