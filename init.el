;;; init.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Created: Aug 2013
;; Version: 0.0.1
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; init.el of NAE

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

(defvar nae-dir user-emacs-directory)
(defvar nae-core-dir (expand-file-name "core" nae-dir))
(defvar nae-modules-dir (expand-file-name  "modules" nae-dir))
(defvar nae-vendor-dir (expand-file-name  "vendor" nae-dir))
(defvar nae-custom-dir (expand-file-name "custom" nae-dir))
(defvar nae-gen-dir (expand-file-name "savefile" nae-dir))

(unless (file-exists-p nae-gen-dir)
  (make-directory nae-gen-dir))

(add-to-list 'load-path nae-dir)
(add-to-list 'load-path nae-core-dir)
(add-to-list 'load-path nae-modules-dir)
(add-to-list 'load-path nae-vendor-dir)
(add-to-list 'load-path nae-custom-dir)

(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-gui* (if window-system t nil))

;; 彩蛋
(defconst wq! "Damn you! I am not vi!  Use C-x C-c instead.")

(require 'nae-packages)

(load "nae-modules")

;; 开启server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Customize Emacs所自动生成的配置
(setq custom-file (expand-file-name "custom.el" nae-gen-dir))
(when (file-exists-p custom-file)
  (load custom-file))

;; 本地配置
(require 'nae-local nil t)

;;; init.el ends here
