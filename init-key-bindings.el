(setq mac-command-modifier 'meta)

(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "M-.") 'helm-etags-select)

(provide 'init-key-bindings)
