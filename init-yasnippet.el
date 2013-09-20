(require-package 'popup)
(require-package 'yasnippet)

(yas-global-mode 1)

;; 设置snippets存放的目录
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;; 加载yasnippet后刷新下缓存，不然会加载elpa里面的snippets
(after-load 'yasnippet
  (yas-reload-all))

;; 缩进至当前列
(setq yas-indent-line 'fixed)

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
