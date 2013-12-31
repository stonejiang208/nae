(require-package 'php-mode)

(setq php-mode-coding-style 'symfony2)

;; 更改php注释类型
(add-hook 'php-mode-hook
          (lambda ()
            (setq php-manual-path "~/.emacs.d/php-manual/")
            ;; 避免与global-set-key的冲突
            (local-unset-key (kbd "C-."))
            ;; 遇到ac-stop-words时不弹出auto-complete菜单
            (make-local-variable 'ac-stop-words)
            (add-to-list 'ac-stop-words "php")))

(provide 'init-php)
