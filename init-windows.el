;; 让window布局也可以redo和undo，默认键绑定为C-c <left>和C-c <right>
(winner-mode 1)

;; 允许使用S-<top>、S-<right>等移动窗口
(windmove-default-keybindings)

(require-package 'switch-window)
(setq switch-window-shortcut-style 'alphabet)

;; 垂直并排的两个windows切换为水平并排的windows
;; 水平并排的两个windows切换为垂直并排的windows
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(provide 'init-windows)
