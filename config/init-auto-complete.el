;; popup这个貌似要移到别的地方，有依赖关系，看github上其它仓库的做法
(require-package 'popup)
(require-package 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

(setq ac-use-quick-help nil)
;; 不自动出现补全菜单
;; (setq-default ac-auto-start 'nil)
;; 出现补全菜单时不更新行号
(ac-linum-workaround)

(provide 'init-auto-complete)
