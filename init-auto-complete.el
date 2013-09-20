(require-package 'auto-complete)
(require 'auto-complete-config)

(setq ac-dictionary-directories (append ac-dictionary-directories '("~/.emacs.d/auto-complete-dict")))

(ac-config-default)
(setq ac-use-quick-help nil)
;; 出现补全菜单时不更新行号
(ac-linum-workaround)

(define-key ac-mode-map (kbd "C-c a c") 'auto-complete)

(provide 'init-auto-complete)
