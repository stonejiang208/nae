;;; nae-bookmark.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-bookmark.el of NAE

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

(nae-require-package 'bookmark+)

(setq bookmark-default-file (expand-file-name "bookmarks" nae-savefile-dir))
(setq bmkp-bmenu-state-file (expand-file-name ".emacs-bmk-bmenu-state.el" nae-savefile-dir))

;; 更改书签后立即保存
(setq bookmark-save-flag 1)

;; 参考http://stackoverflow.com/questions/12023262/getting-bookmark-bmenu-list-into-a-new-frame
;; 还不是很明白(bookmark-bmenu-list)不是应该在other window创建了一个*Bookmark List*吗，为什么
;; 在current window调用switch-to-buffer切换到*Bookmark List*后other-window没有显示*Bookmark List*
(defun get-bookmarks-in-current-window ()
  (interactive)
  (bookmark-bmenu-list)
  (switch-to-buffer "*Bookmark List*"))

(provide 'nae-bookmark)

;;; nae-bookmark.el ends here
