(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 这里有一个问题，字体大小设置为14时，undo-tree的buffer将会一直出现在当前buffer下面
;; 而不会出现在当前buffer右边，而字体大小设置为12即默认大小时，undo-tree的buffer将会
;; “随机应变”，其它会出现临时buffer的情况都会存在该问题，所幸问题不影响正常使用
(set-default-font "Source Code Pro-14")
(set-fontset-font "fontset-default" 'gb18030' ("STHeiti" . "unicode-bmp"))

(setq inhibit-startup-message t)

;; 在标题栏中显示文件路径
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(provide 'init-gui-frames)
