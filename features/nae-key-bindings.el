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

(global-set-key "\C-x2" 'split-window-below-and-focus)
(global-set-key "\C-x3" 'split-window-right-and-focus)

;; window间切换
(global-set-key (kbd "S-<up>") 'windmove-up-cycle)
(global-set-key (kbd "S-<down>") 'windmove-down-cycle)
(global-set-key (kbd "S-<right>") 'windmove-right-cycle)
(global-set-key (kbd "S-<left>") 'windmove-left-cycle)

;; 交换window
(global-set-key (kbd "S-M-<up>") 'buffer-up-swap)
(global-set-key (kbd "S-M-<down>") 'buffer-down-swap)
(global-set-key (kbd "S-M-<right>") 'buffer-right-swap)
(global-set-key (kbd "S-M-<left>") 'buffer-left-swap)

;; Window Resizing keybindings
;; (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
;; (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "S-C-<down>") 'shrink-window)
;; (global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; iTerm meta-shift-<arrows> fix
;; (define-key input-decode-map "\e[1;10A" [M-S-up])
;; (define-key input-decode-map "\e[1;10B" [M-S-down])
;; (define-key input-decode-map "\e[1;10C" [M-S-right])
;; (define-key input-decode-map "\e[1;10D" [M-S-left])

(define-key ctl-x-4-map "t" 'toggle-window-split)

(provide 'nae-key-bindings)
