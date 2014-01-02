;; youdao翻译
(require 'youdao)

(setf youdao-key-from "PersonalPage")
(setf youdao-key "94490353")

(setq shell-file-name "/usr/local/bin/bash")

(setq org-agenda-files (list "~/Dropbox/todo/校园招聘.org"
                             "~/Dropbox/todo/学校相关.org"))

(dir-locals-set-directory-class "/Applications/MAMP/htdocs/wordpress/" 'wordpress)
(dir-locals-set-directory-class "~/Emacs/" 'wordpress)

(provide 'init-local)
