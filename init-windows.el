;; 让window布局也可以redo和undo，默认键绑定为C-c <left>和C-c <right>
(winner-mode 1)

;; 允许使用S-<top>、S-<right>等移动窗口
(windmove-default-keybindings)

(require-package 'switch-window)
(setq switch-window-shortcut-style 'alphabet)

(provide 'init-windows)
