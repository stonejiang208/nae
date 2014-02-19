;;; nae-gui-frames.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <ihellobear@gmail.com>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-gui-frames.el of NAE

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

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 这里有一个问题，字体大小设置为14时，undo-tree的buffer将会一直出现在当前buffer下面
;; 而不会出现在当前buffer右边，而字体大小设置为12即默认大小时，undo-tree的buffer将会
;; “随机应变”，其它会出现临时buffer的情况都会存在该问题，所幸问题不影响正常使用
;; 中英文设置不同的大小是为了org mode的表格能正常对齐
(eval-when-compile (require 'cl))
;; 设置中英文为不同的字体及大小
(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))
(if *is-gui* (set-font "Source Code Pro" "STHeiti" 14 16))

(setq inhibit-startup-message t)

;; 在标题栏中显示文件路径
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(provide 'nae-gui-frames)

;;; nae-gui-frames.el ends here
