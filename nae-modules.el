;;; nae-modules.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-modules.el of NAE

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

(require 'nae-utils)
(require 'nae-themes)
(require 'nae-exec-path)

(require 'nae-gui-frames)

(require 'nae-tramp)

(require 'nae-dired)
(require 'nae-ibuffer)
(require 'nae-recentf)
(require 'nae-isearch)
(require 'nae-projectile)
(require 'nae-flycheck)
;; (require 'nae-flyspell)
(require 'nae-compile)
(require 'nae-yasnippet)
(require 'nae-auto-complete)
(require 'nae-helm)

(require 'nae-ido)
(require 'nae-bookmark)
(require 'nae-hippie-expand)
(require 'nae-windows)
(require 'nae-sessions)
(require 'nae-git)
(require 'nae-vi)

(require 'nae-autopair)
(require 'nae-editing-utils)

(require 'nae-web-mode)
(require 'nae-c)
(require 'nae-php)
(require 'nae-org)
(require 'nae-slime)
(require 'nae-emmet)
(require 'nae-vimrc-mode)
(require 'nae-thrift)

(require 'nae-shell)
(require 'nae-w3m)
(require 'nae-rss)
(require 'nae-douban-fm)
(require 'nae-calendar)

(require 'nae-misc)
(require 'nae-dir-locals)

(require 'nae-key-bindings)

(require 'nae-locales)

;;; nae-modules.el ends here
