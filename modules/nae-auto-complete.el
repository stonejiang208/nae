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

;; 以下取消auto-complete默认的tab绑定，并绑定C-i为新的快捷键
;; 下面问题的答案中提到tab和C-i在ASCII中表示同样的字符，所以一般给C-i绑定新功能，会同时影响tab的
;; 功能，解决方法是先(define-key input-decode-map (kbd "C-i") (kbd "H-i"))，然后给H-i绑定功能
;; 见 http://stackoverflow.com/q/1792326
;; ac-expand绑定到tab
(define-key ac-completing-map "\t" nil)
(define-key ac-completing-map [tab] nil)
(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
(define-key ac-completing-map (kbd "H-i") 'ac-expand)
;; 取消回车键的ac-complete绑定
;; (define-key ac-completing-map "\r" nil)
;; (define-key ac-completing-map [return] nil)
;; (define-key ac-completing-map "\r" 'ac-complete)
;; (define-key ac-completing-map [return] 'ac-complete)

(provide 'nae-auto-complete)
