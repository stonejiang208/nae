;;; nae-misc.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-misc.el of NAE

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

;; 不问 yes-or-no，只问 y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; 当光标抵达最后一行不增加新行
(setq next-line-add-newlines nil)

(setq auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" nae-gen-dir))

(provide 'nae-misc)

;;; nae-misc.el ends here
