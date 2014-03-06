;;; nae-org.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-org.el of NAE

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

(nae-require-package 'org '(20130916))
(nae-require-package 'htmlize)

;; 记录TODO完成的时间
(setq org-log-done 'time)

;; 在所有子项目完成后才能设定TODO项目为完成
(setq org-enforce-todo-dependencies t)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;; 所有子项目完成后自动设定TODO项目为完成
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; 在当前window显示agenda
(setq org-agenda-window-setup 'current-window)

;; 在agenda view中显示日历中的节日
(setq org-agenda-include-diary t)

(require 'ox-publish)

;; (setq org-html-postamble-format (quote (("zh-CN" "<p class=\"license\">本文采用 <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-sa/3.0/cn/\">知识共享署名-相同方式共享 3.0 中国大陆许可协议</a> 进行许可</p><p class=\"date\">%d</p>"))))
(setq org-html-postamble-format '(("zh-CN" "<p class=\"author\">作者：%a (%e)</p>\n<p class=\"date\">日期：%d</p>")))
(setq org-html-preamble t)
(setq org-html-postamble nil)
(setq org-src-fontify-natively t)
(setq org-publish-sitemap-sort-files 'anti-chronologically)
(setq org-html-head-include-default-style nil)
(setq org-html-head-include-scripts nil)

;; 生成的html不附上xml声明
(setq org-html-xml-declaration nil)

(setq org-publish-project-alist
      '(("blog"
         :author "hellobear"
         :email "i@hellobear.net"
         :language "zh-CN"
         :base-directory "~/Dropbox/mysite/web/blog"
         :base-extension "org"
         :auto-sitemap t
         :sitemap-filename "sitemap.org"
         :sitemap-title "Sitemap"
         :sitemap-file-entry-format "%t"
         :publishing-function org-html-publish-to-html
         :publishing-directory "~/Dropbox/mysite/gen/blog"
         :htmlized-source t
         :recursive t
         :headline-levels 4
         :html-link-up "/blog/sitemap.html"
         :html-link-home "/"
         :html-head "<meta http-equiv=\"pragma\" content=\"no-cache\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/blog.css\" />"
         :html-postamble t)
        ("static"
         :base-directory "~/Dropbox/mysite/web"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|ico\\|pdf\\|mp3\\|ogg\\|swf\\|html"
         :publishing-function org-publish-attachment
         :publishing-directory "~/Dropbox/mysite/gen"
         :recursive t)))

;; make the windmove function active in locations where Org mode does not have special functionality on S-<cursor>
(when (featurep 'windcycle)
  (add-hook 'org-shiftup-final-hook 'windmove-up-cycle)
  (add-hook 'org-shiftleft-final-hook 'windmove-left-cycle)
  (add-hook 'org-shiftdown-final-hook 'windmove-down-cycle)
  (add-hook 'org-shiftright-final-hook 'windmove-right-cycle))

(provide 'nae-org)

;;; nae-org.el ends here
