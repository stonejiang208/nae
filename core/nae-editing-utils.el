;;; nae-editing-utils.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-editing-utils.el of NAE

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

(setq visible-bell t)

(global-linum-mode t)
(column-number-mode t)
(global-visual-line-mode 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; 显示括号匹配, 而不是匹配后短暂的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; 左括号在可见范围之外时，输入右括号会在minibuffer显示左括号附近的内容
(setq blink-matching-paren t)

;; undo-tree
(nae-require-package 'undo-tree)
(global-undo-tree-mode 1)

(global-set-key (kbd "C-/") 'undo-tree-undo)
(global-set-key (kbd "M-/") 'undo-tree-redo)

;; 只在替换时大小写敏感
(defadvice replace-string (around turn-off-case-fold-search)
  (let ((case-fold-search nil))
    ad-do-it))

(ad-activate 'replace-string)

;; 所有备份文件都转存到 ~/.emacs.d/backup 中
(defun my-backup-file-name (fpath)
  (let* (
         (backupRootDir "~/.emacs.d/backup/")
         (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath ))
         (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
         )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath))

(setq make-backup-file-name-function 'my-backup-file-name)

;; 不备份使用su或者sudo命令打开的文件，因此通过Tramp打开的文件不会被备份
;; 养成良好的习惯，进行重要文件操作前，手动备份
(setq backup-enable-predicate
      (lambda (name)
        (and (normal-backup-enable-predicate name)
             (not
              (let ((method (file-remote-p name 'method)))
                (when (stringp method)
                  (member method '("su" "sudo"))))))))

(setq-default show-trailing-whitespace t)

;; 某些mode不开启show-trailing-whitespace
(dolist (hook '(calendar-mode-hook
                comint-mode-hook
                completion-list-mode-hook
                elfeed-show-mode-hook
                elfeed-search-mode-hook
                package-menu-mode-hook
                shell-mode-hook
                term-mode-hook))
  (add-hook hook
            (lambda () (setq show-trailing-whitespace nil))))

;; 以下与autopair冲突，我都不太记得之前为什么要搞下面这个
;; (dolist (hook '(web-mode-hook
;;                 php-mode-hook
;;                 c-mode-hook))
;;   (add-hook hook
;;             (lambda ()
;;               (local-set-key (kbd "<backspace>") 'my-delete-backward-char))))

;; http://www.emacswiki.org/emacs/WholeLineOrRegion
;; 上面链接有个bug fix，但是我没有遇到过上面描述的情况
;; 一些作用于region的命令在没有region的情况下执行，作用范围为当前行
(require 'whole-line-or-region)
;; 默认启用该mode
(whole-line-or-region-mode t)

(provide 'nae-editing-utils)

;;; nae-editing-utils.el ends here
