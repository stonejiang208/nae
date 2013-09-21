; 不问 yes-or-no，只问 y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

; 当光标抵达最后一行不增加新行
(setq next-line-add-newlines nil)

(provide 'init-misc)
