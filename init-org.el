(require-package 'org '(20130916))

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

(require 'ox-publish)

(setq org-html-postamble-format (quote (("zh-CN" "<p class=\"license\">本文采用 <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-sa/3.0/cn/\">知识共享署名-相同方式共享 3.0 中国大陆许可协议</a> 进行许可</p><p class=\"date\">%d</p>"))))
(setq org-html-preamble nil)
(setq org-html-postamble nil)


;; 生成的html不附上xml声明
(setq org-html-xml-declaration nil)

(setq org-publish-project-alist
      '(
        ("org"
         :author "dongxiong"
         :language "zh-CN"
         :base-directory "~/Dropbox/blog/org/"
         :base-extension "org"
         :sitemap-filename "sitemap.org"
         :sitemap-title "Sitemap"
         :sitemap-sort-files "anti-chronologically"
         :sitemap-file-entry-format "%t"
         :publishing-directory "~/Dropbox/blog/html/"
         :publishing-function org-html-publish-to-html
         :recursive t
         :headline-levels 4
         :auto-sitemap t
         :html-link-up "/sitemap.html"
         :html-link-home "/"
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/style.css\" />"
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         )
        ("static"
         :base-directory "~/Dropbox/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|html"
         :publishing-directory "~/Dropbox/blog/html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("org" "static"))
        ))

(provide 'init-org)
