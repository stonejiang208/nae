(require-package 'php-mode)

;; 提供选择的coding style：codeigniter、drupal、pear、symfony2、wordpress
;; (setq my-php-mode-coding-style 'codeigniter)
(setq php-mode-coding-style 'symfony2)

;; (cond ((memq my-php-mode-coding-style '(drupal pear symfony2 wordpress))
;;        (setq php-mode-coding-style my-php-mode-coding-style))
;;       ((eq my-php-mode-coding-style 'codeigniter)
;;        (setq php-mode-coding-style 'pear)))

;; (defun check-php-coding-style (styles)
;;   (and (boundp 'my-php-mode-coding-style)
;;        (memq my-php-mode-coding-style styles)))

;; (check-php-coding-style '(pear symfony2))

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
