;; 让window布局也可以redo和undo，默认键绑定为C-c <left>和C-c <right>
(winner-mode 1)

;; 允许使用S-<top>、S-<right>等移动窗口
(windmove-default-keybindings)

(require-package 'switch-window)
(setq switch-window-shortcut-style 'alphabet)


(defun split-window-func-with-other-buffer (split-function)
  (lexical-let ((s-f split-function))
    (lambda ()
      (interactive)
      (funcall s-f)
      (set-window-buffer (next-window) (other-buffer)))))

;; 让水平并排的窗口垂直并排
(defun split-window-horizontally-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-horizontally))))

;; 让垂直并排的窗口水平并排
(defun split-window-vertically-instead ()
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-vertically))))

(provide 'init-windows)
