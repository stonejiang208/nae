(require-package 'org '(20130916))

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

(require 'ox-publish)

(setq org-html-postamble-format (quote (("cn" "<p class=\"author\">作者： %a</p>
<p class=\"date\">日期： %d</p>"))))

(setq org-publish-project-alist
      '(
	("org-notes"
	 :author "求其"
	 :language "cn"
	 :base-directory "~/org/"
	 :base-extension "org"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-sitemap t
	 :html-head-include-default-style nil
	 :html-head-include-scripts nil
	 :html-postamble t
	 )
	("org-static"
	 :base-directory "~/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("org" :components ("org-notes" "org-static"))
        ))

(provide 'init-org)
