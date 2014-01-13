(require-package 'autopair)

(autopair-global-mode)
(setq autopair-blink nil)

;; emacs lisp mode中注释和字符串中输入 ` 后补全 '
(add-hook 'emacs-lisp-mode-hook
          #'(lambda ()
              (push '(?` . ?')
                    (getf autopair-extra-pairs :comment))
              (push '(?` . ?')
                    (getf autopair-extra-pairs :string))))

(provide 'nae-autopair)
