;;; nae-rss.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <ihellobear@gmail.com>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-rss.el of NAE

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

(nae-require-package 'elfeed)

(setq elfeed-feeds
      '("http://coolshell.cn/feed"
        "http://dlfkevin.com/feed"
        "http://www.guao.hk/feed"
        "http://hawklim.com/?feed=rss2"
        "http://iamhiko.com/feed"
        "http://segmentfault.com/feeds"
        "http://v2ex.com/feed/tab/jobs.xml"
        "http://www.laruence.com/feed"))

(provide 'nae-rss)

;;; nae-rss.el ends here
