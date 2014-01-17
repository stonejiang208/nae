;;; nae-yasnippet.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <ihellobear@gmail.com>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-yasnippet.el of NAE

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

(nae-require-package 'yasnippet)

;; 设置snippets存放的目录
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;; 位于setq yas-snippet-dirs之后，避免加载elpa里面的snippets
(yas-global-mode 1)

;; yas-new-snippet模板
(setq yas-new-snippet-default "# -*- mode: snippet -*-
# name: $1
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# --
$0")

;; 展开后indent-according-to-mode
(setq yas-indent-line 'auto)

(add-hook 'yas-before-expand-snippet-hook
          '(lambda ()
             (setq show-trailing-whitespace nil)))

(add-hook 'yas-after-exit-snippet-hook
          '(lambda ()
             ;; snippet展开结束后删除snippet范围内的行尾空白
             (let ((line-beg (nae-point-at-line yas-snippet-beg))
                   (line-end (nae-point-at-line yas-snippet-end)))
               ;; 展开后根据indent-tabs-mode对空格进行转换
               (if indent-tabs-mode
                   (tabify yas-snippet-beg yas-snippet-end)
                 (untabify yas-snippet-beg yas-snippet-end))

               ;; 移除展开的代码断范围内的行末空格
               ;; 这里结束后显示Mark set
               (delete-trailing-whitespace-except-current-line
                (nae-line-beg-point line-beg)
                (nae-line-end-point line-end)))

             ;; 显示行末空白
             (setq show-trailing-whitespace t)))

(setq yas-prompt-functions '(yas-ido-prompt yas-no-prompt))

;; snippet mode使用tab进行缩进，便于展开后tab转换成空格
(add-hook 'snippet-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)))

(provide 'nae-yasnippet)

;;; nae-yasnippet.el ends here
