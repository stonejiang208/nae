(setq mac-command-modifier 'meta)

(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key "\C-x2" (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key "\C-x3" (split-window-func-with-other-buffer 'split-window-horizontally))
(global-set-key "\C-x|" 'split-window-horizontally-instead)
(global-set-key "\C-x_" 'split-window-vertically-instead)

(provide 'init-key-bindings)
