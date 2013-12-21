(require-package 'popup)
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

;; snippet展开结束后删除snippet范围内的行尾空白
(add-hook 'yas-after-exit-snippet-hook
          '(lambda ()
             (delete-trailing-whitespace-except-current-line yas-snippet-beg yas-snippet-end)
             (setq show-trailing-whitespace t)))

;; 使用helm选择snippets
(defun yas-helm-prompt (prompt choices &optional display-fn)
  "Use helm to select a snippet. Put this into `yas-prompt-functions.'"
  (interactive)
  (setq display-fn (or display-fn 'identity))
  (if (require 'helm-config)
      (let (tmpsource cands result rmap)
        (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
        (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
        (setq tmpsource
              (list
               (cons 'name prompt)
               (cons 'candidates cands)
               '(action . (("Expand" . (lambda (selection) selection))))
               ))
        (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
        (if (null result)
            (signal 'quit "user quit!")
          (cdr (assoc result rmap))))
    nil))

(setq yas-prompt-functions '(yas-helm-prompt yas-ido-prompt yas-no-prompt))

(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "TAB") 'popup-next)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
(define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)

(provide 'init-yasnippet)
