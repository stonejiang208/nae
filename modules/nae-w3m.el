;;; nae-w3m.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-w3m.el of NAE

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

(nae-require-package 'w3m)

;; (setq url-cookie-file (expand-file-name "url/cookies/" nae-savefile-dir))

;; 开启按f键显示链接编号的功能
(w3m-lnum-mode)

(setq w3m-home-page "https://www.google.com.hk")
(setq w3m-default-display-inline-images t)
(setq w3m-use-cookies t)

;; 设置w3m为默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)

(provide 'nae-w3m)

;;; nae-w3m.el ends here
