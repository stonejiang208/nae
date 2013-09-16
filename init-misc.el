; 不问 yes-or-no，只问 y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

; 更改书签后立即保存
(setq bookmark-save-flag 1)

; 当光标抵达最后一行不增加新行
(setq next-line-add-newlines nil)

(provide 'init-misc)
