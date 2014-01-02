(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-c f") 'jump-to-char)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x r l") 'get-bookmarks-in-current-window)
(global-set-key (kbd "M-.") 'helm-etags-select)
(global-set-key (kbd "M-/") 'hippie-expand)
;; (global-set-key (kbd "C-j") 'yas-expand)

(global-set-key "\C-x2" 'split-window-below-and-focus)
(global-set-key "\C-x3" 'split-window-right-and-focus)
(global-set-key (kbd "M-S-<up>") 'buf-move-up)
(global-set-key (kbd "M-S-<down>") 'buf-move-down)
(global-set-key (kbd "M-S-<left>") 'buf-move-left)
(global-set-key (kbd "M-S-<right>") 'buf-move-right)

(define-key ctl-x-4-map "t" 'toggle-window-split)

(provide 'nae-key-bindings)