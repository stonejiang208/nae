;;; nae-auto-complete.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-auto-complete.el of NAE

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

(nae-require-package 'popup)
(nae-require-package 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)

(setq ac-comphist-file (expand-file-name "ac-comphist.dat" nae-savefile-dir))

(setq ac-use-quick-help nil)
;; 不自动出现补全菜单
;; (setq-default ac-auto-start 'nil)
;; 出现补全菜单时不更新行号
(ac-linum-workaround)

(define-key ac-completing-map "\t" nil)
(define-key ac-completing-map [tab] nil)
(define-key ac-completing-map (kbd "C-j") 'ac-expand)
;; 取消回车键的ac-complete绑定
;; (define-key ac-completing-map "\r" nil)
;; (define-key ac-completing-map [return] nil)
;; (define-key ac-completing-map "\r" 'ac-complete)
;; (define-key ac-completing-map [return] 'ac-complete)

;; @HACK
;; @TODO "auto-complete/dict"使用变量替代
;; 设置auto-complete的dict在原来的基础上加上auto-complete-dict
;; 其中存有一份dict/javascript-mode的拷贝，命名为js-mode
;; 解决auto-complete在js文件下无效
(if (boundp 'ac-dictionary-directories)
    (add-to-list 'ac-dictionary-directories
                 (expand-file-name "auto-complete/dict" nae-modules-dir)))

(provide 'nae-auto-complete)

;;; nae-auto-complete.el ends here
