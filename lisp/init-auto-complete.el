(require-package 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(setq ac-use-quick-help nil)
;; 出现补全菜单时不更新行号
(ac-linum-workaround)

(provide 'init-auto-complete)
