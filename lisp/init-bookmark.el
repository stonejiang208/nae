(require-package 'bookmark+)

;; 更改书签后立即保存
(setq bookmark-save-flag 1)

;; 参考http://stackoverflow.com/questions/12023262/getting-bookmark-bmenu-list-into-a-new-frame
;; 还不是很明白(bookmark-bmenu-list)不是应该在other window创建了一个*Bookmark List*吗，为什么
;; 在current window调用switch-to-buffer切换到*Bookmark List*后other-window没有显示*Bookmark List*
(defun get-bookmarks-in-current-window ()
  (interactive)
  (bookmark-bmenu-list)
  (switch-to-buffer "*Bookmark List*"))

(provide 'init-bookmark)
