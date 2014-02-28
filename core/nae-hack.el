;;; nae-hack.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-hack.el of NAE

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

;; 设置auto-complete的dict在原来的基础上加上auto-complete-dict
;; 其中存有一份dict/javascript-mode的拷贝，命名为js-mode
;; 解决auto-complete在js文件下无效
(if (boundp 'ac-dictionary-directories)
    (setq ac-dictionary-directories (append ac-dictionary-directories '("~/.emacs.d/auto-complete-dict"))))

;; 与elpa中的projectile稍有不同
(defun projectile-replace (arg)
  "Replace a string in the project using `tags-query-replace'.

With a prefix argument ARG prompts you for a directory on which to run the replacement."
  (interactive "P")
  (let* ((old-text (read-string
                    (projectile-prepend-project-name "Replace: ")
                    (projectile-symbol-at-point)))
         (new-text (read-string
                    (projectile-prepend-project-name
                     (format "Replace %s with: " old-text))))
         (directory (if arg
                        (read-directory-name "Replace in directory: ")
                      (projectile-project-root)))
         (files (projectile-files-with-string old-text directory)))
    (tags-query-replace old-text new-text nil 'files)))

;; 一个hack，若没有以下语句projectile-ack命令会报错
(require 'ack-and-a-half)

(provide 'nae-hack)

;;; nae-hack.el ends here
