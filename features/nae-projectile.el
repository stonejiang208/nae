(require-package 'projectile)

(projectile-global-mode)

;; projectile排除的目录
(setq projectile-globally-ignored-directories '(".idea" ".eunit" ".svn" ".git" ".hg" ".fslckout" ".bzr" "_darcs"))

;; ack
(require-package 'ack-and-a-half)

(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; recentf
(require-package 'recentf)

(recentf-mode 1)

(provide 'nae-projectile)
