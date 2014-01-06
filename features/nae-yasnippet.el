(require-package 'yasnippet)

;; 设置snippets存放的目录
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;; 位于setq yas-snippet-dirs之后，避免加载elpa里面的snippets
(yas-global-mode 1)

;; yas-new-snippet模板
(setq yas-new-snippet-default "# -*- mode: snippet -*-
# name: $1
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# --
$0")

;; 缩进至当前列
(setq yas-indent-line 'fixed)

(add-hook 'yas-before-expand-snippet-hook
          '(lambda ()
             (setq show-trailing-whitespace nil)))

(add-hook 'yas-after-exit-snippet-hook
          '(lambda ()
             ;; snippet展开结束后删除snippet范围内的行尾空白
             (let ((line-beg (nae-point-at-line yas-snippet-beg))
                   (line-end (nae-point-at-line yas-snippet-end)))
               ;; 展开后根据indent-tabs-mode对空格进行转换
               (if indent-tabs-mode
                   (tabify yas-snippet-beg yas-snippet-end)
                 (untabify yas-snippet-beg yas-snippet-end))

               ;; 移除展开的代码断范围内的行末空格
               ;; 这里结束后显示Mark set
               (delete-trailing-whitespace-except-current-line
                (nae-line-beg-point line-beg)
                (nae-line-end-point line-end)))

             ;; 显示行末空白
             (setq show-trailing-whitespace t)))

(setq yas-prompt-functions '(yas-ido-prompt yas-no-prompt))

;; 以下取消yasnippet默认的tab绑定，并绑定C-i为新的快捷键
;; 下面问题的答案中提到tab和C-i在ASCII中表示同样的字符，所以一般给C-i绑定新功能，会同时影响tab的
;; 功能，解决方法是先(define-key input-decode-map (kbd "C-i") (kbd "H-i"))，然后给H-i绑定功能
;; 见 http://stackoverflow.com/q/1792326
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
(define-key yas-minor-mode-map (kbd "H-i") 'yas-expand)

(provide 'nae-yasnippet)
