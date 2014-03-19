;;; nae-key-bindings.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-key-bindings.el of NAE

;;; License:

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

;; (global-set-key (kbd "<return>") 'newline-and-indent)
(global-set-key (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-c z") 'nae-last-closed-file)
(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-x x") 'kill-buffer-and-its-windows)
(global-set-key (kbd "C-x r l") 'get-bookmarks-in-current-window)
(global-set-key (kbd "M-.") 'helm-etags-select)
;; (global-set-key (kbd "M-/") 'hippie-expand)

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

;;; nae-key-bindings.el ends here
