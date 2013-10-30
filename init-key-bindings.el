(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)

(global-set-key (kbd "C-c f") 'jump-to-char)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "M-.") 'helm-etags-select)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key "\C-x2" 'split-window-below-and-focus)
(global-set-key "\C-x3" 'split-window-right-and-focus)

(define-key ctl-x-4-map "t" 'toggle-window-split)

(provide 'init-key-bindings)
