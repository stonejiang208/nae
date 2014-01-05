(require-package 'php-mode)

;; 提供选择的coding style：codeigniter、drupal、pear、symfony2、wordpress
;; (setq nae-php-mode-coding-style 'codeigniter)
(setq nae-php-mode-coding-style 'wordpress)

(cond ((memq nae-php-mode-coding-style '(drupal pear symfony2 wordpress))
       (setq php-mode-coding-style nae-php-mode-coding-style))
      ((eq nae-php-mode-coding-style 'codeigniter)
       (setq php-mode-coding-style 'pear)))

;; 当前php coding style是否在列表实参中
(defun nae-in-php-coding-styles (styles)
  (and (boundp 'nae-php-mode-coding-style)
       (memq nae-php-mode-coding-style styles)))

(nae-in-php-coding-styles '(pear codeigniter))

;; 更改php注释类型
(add-hook 'php-mode-hook
          (lambda ()
            ;; 以下intern改成make-symbol会达不到预期效果，尚不是很明白两者的区别
            (when (memq nae-php-mode-coding-style '(codeigniter))
              (yas-activate-extra-mode (intern (concat (symbol-name nae-php-mode-coding-style) "-mode"))))

            (setq php-manual-path "~/.emacs.d/php-manual/")
            ;; 避免与global-set-key的冲突
            (local-unset-key (kbd "C-."))
            ;; 遇到ac-stop-words时不弹出auto-complete菜单
            (make-local-variable 'ac-stop-words)
            (add-to-list 'ac-stop-words "php")))

(provide 'nae-php)
