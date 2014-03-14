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

;; 设定export语言
(setq org-export-default-language "zh-CN")

(setq org-html-preamble-format '(("zh-CN" "<p class=\"author\">作者：%a (<script type=\"text/javascript\">document.write(\"<n uers=\\\"znvygb:v@uryyborne.arg\\\">v@uryyborne.arg</n>\".replace(/[a-zA-Z]/g,
function(c){return String.fromCharCode((c<=\"Z\"?90:122)>=(c=c.charCodeAt(0)+13)?c:c-26);}));
</script>)</p>\n<p class=\"date\">日期：%d</p>")))
;; (setq org-html-postamble-format (quote (("zh-CN" "<p class=\"license\">本文采用 <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-sa/3.0/cn/\">知识共享署名-相同方式共享 3.0 中国大陆许可协议</a> 进行许可</p><p class=\"date\">%d</p>"))))
(setq org-html-postamble-format '(("zh-CN" "
 <div id=\"disqus_thread\"></div>
    <script type=\"text/javascript\">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'hellobear'; // required: replace example with your forum shortname

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>
    <a href=\"http://disqus.com\" class=\"dsq-brlink\">comments powered by <span class=\"logo-disqus\">Disqus</span></a>
")))

 ;; <div id=\"disqus_thread\"></div>
 ;;    <script type=\"text/javascript\">
 ;;        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
 ;;        var disqus_shortname = 'hellobear'; // required: replace example with your forum shortname

 ;;        /* * * DON'T EDIT BELOW THIS LINE * * */
 ;;        (function() {
 ;;            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
 ;;            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
 ;;            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
 ;;        })();
 ;;    </script>
 ;;    <noscript>Please enable JavaScript to view the <a href=\"http://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>
 ;;    <a href=\"http://disqus.com\" class=\"dsq-brlink\">comments powered by <span class=\"logo-disqus\">Disqus</span></a>

(setq org-html-preamble nil)
(setq org-html-postamble nil)
(setq org-src-fontify-natively t)
(setq org-publish-sitemap-sort-files 'anti-chronologically)
(setq org-html-head-include-default-style nil)
(setq org-html-head-include-scripts nil)

;; 生成的html不附上xml声明
(setq org-html-xml-declaration nil)

(setq org-publish-project-alist
      '(("blog"
         :base-directory "~/Dropbox/mysite/web/blog"
         :base-extension "org"
         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "HB's Blog"
         :sitemap-file-entry-format "%d » [%t]"
         :publishing-function org-html-publish-to-html
         :publishing-directory "~/Dropbox/mysite/gen/blog"
         :htmlized-source t
         :recursive t
         :headline-levels 4
         :html-link-up "../"
         :html-link-home "/"
         :html-head "<meta http-equiv=\"pragma\" content=\"no-cache\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/solarized-light.css\" />")
        ("wiki"
         :base-directory "~/Dropbox/mysite/web/wiki"
         :base-extension "org"
         :auto-sitemap t
         :sitemap-filename "index.org"
         :sitemap-title "HB's Personal Wiki"
         :publishing-function org-html-publish-to-html
         :publishing-directory "~/Dropbox/mysite/gen/wiki"
         :htmlized-source nil
         :html-link-up "/"
         :html-link-home "/"
         :html-head "<meta http-equiv=\"pragma\" content=\"no-cache\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/wiki.css\" />"
         )
        ("c-standard"
         :base-directory "~/Dropbox/mysite/c-standard"
         :publishing-function org-html-publish-to-html
         :publishing-directory "~/Dropbox/mysite/c-standard-gen"
         :html-link-up "index.html"
         :html-link-home "/"
         :section-numbers nil)
        ("static"
         :base-directory "~/Dropbox/mysite/web"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|ico\\|pdf\\|mp3\\|ogg\\|swf\\|html"
         :publishing-function org-publish-attachment
         :publishing-directory "~/Dropbox/mysite/geN"
         :recursive t)))

;; Make the windmove function active in locations where Org mode does not have special functionality on S-<cursor>
(when (featurep 'windcycle)
  (add-hook 'org-shiftup-final-hook 'windmove-up-cycle)
  (add-hook 'org-shiftleft-final-hook 'windmove-left-cycle)
  (add-hook 'org-shiftdown-final-hook 'windmove-down-cycle)
  (add-hook 'org-shiftright-final-hook 'windmove-right-cycle))

(provide 'nae-org)

;;; nae-org.el ends here
