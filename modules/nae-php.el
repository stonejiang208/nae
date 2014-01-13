(nae-require-package 'php-mode)

;; 提供选择的coding style：codeigniter、drupal、pear、symfony2、wordpress
(setq nae-php-mode-coding-style 'symfony2)

;; 当前php coding style是否在列表实参中
(defun nae-in-php-coding-styles (styles)
  (and (boundp 'nae-php-mode-coding-style)
       (memq nae-php-mode-coding-style styles)))

;; 添加CodeIgniter Coding Style
(c-add-style
 "codeigniter"
 '((c-basic-offset . 4)
   (c-offsets-alist . (
					   (topmost-intro-cont . (first c-lineup-cascaded-calls
                                                    php-lineup-arglist-intro))
					   (substatement-open . 0)
					   (case-label . +)
                       (arglist-close . php-lineup-arglist-close)
                       (arglist-intro . php-lineup-arglist-intro)
                       (arglist-cont-nonempty . +)
                       (knr-argdecl . [0])
                       (statement-cont . (first c-lineup-cascaded-calls +))))))

(defun nae-php-enable-coding-style (style)
  ;; 设置nae-php-mode-coding-style为buffer local变量
  (set (make-local-variable 'nae-php-mode-coding-style) style)
  ;; 如果nae-php-mode-coding-style在内置的四种style中，设置php-mode-coding-style
  ;; 的buffer local值为nae-php-mode-coding-style，否则设置php-mode-coding-style
  ;; 为默认的symfony2
  (cond ((memq nae-php-mode-coding-style '(drupal pear symfony2 wordpress))
         (set (make-local-variable 'php-mode-coding-style) nae-php-mode-coding-style))
        ((eq nae-php-mode-coding-style 'codeigniter)
         (set (make-local-variable 'php-mode-coding-style) 'symfony2)))
  ;; 以下intern改成make-symbol会达不到预期效果，尚不是很明白两者的区别
  (when (memq nae-php-mode-coding-style '(codeigniter))
    ;; 启用CodeIgniter Coding Style
    (nae-php-enable-codeigniter-coding-style)
    (yas-activate-extra-mode (intern (concat (symbol-name nae-php-mode-coding-style) "-mode")))))

(defun nae-php-enable-codeigniter-coding-style ()
  "Makes php-mode use coding styles that are preferable for
working with CodeIgniter."
  (interactive)
  (setq indent-tabs-mode t
		fill-column 78
		tab-width 4
		;; 下面这个我也不太清楚是干嘛的，参考php-mode里面的配置
		c-indent-comments-syntactically-p t)
  (c-set-style "codeigniter"))

;; 更改php注释类型
(add-hook 'php-mode-hook
          (lambda ()
            (nae-php-enable-coding-style nae-php-mode-coding-style)
            (setq php-manual-path "~/.emacs.d/php-manual/")
            ;; 避免与global-set-key的冲突
            (local-unset-key (kbd "C-."))))

(provide 'nae-php)
