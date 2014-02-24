;;; nae-auto-complete.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <ihellobear@gmail.com>
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

(setq ac-use-quick-help nil)
;; 不自动出现补全菜单
;; (setq-default ac-auto-start 'nil)
;; 出现补全菜单时不更新行号
(ac-linum-workaround)

;; 以下取消auto-complete默认的tab绑定，并绑定C-i为新的快捷键
;; 下面问题的答案中提到tab和C-i在ASCII中表示同样的字符，所以一般给C-i绑定新功能，会同时影响tab的
;; 功能，解决方法是先(define-key input-decode-map (kbd "C-i") (kbd "H-i"))，然后给H-i绑定功能
;; 见 http://stackoverflow.com/q/1792326
;; ac-expand绑定到tab
(define-key ac-completing-map "\t" nil)
(define-key ac-completing-map [tab] nil)
(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
(define-key ac-completing-map (kbd "H-i") 'ac-expand)
;; 取消回车键的ac-complete绑定
;; (define-key ac-completing-map "\r" nil)
;; (define-key ac-completing-map [return] nil)
;; (define-key ac-completing-map "\r" 'ac-complete)
;; (define-key ac-completing-map [return] 'ac-complete)

(provide 'nae-auto-complete)

;;; nae-auto-complete.el ends here
