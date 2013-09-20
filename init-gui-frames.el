(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-default-font "Source Code Pro-14")
(set-fontset-font "fontset-default" 'gb18030' ("STHeiti" . "unicode-bmp"))

(setq inhibit-startup-message t)

;; 在标题栏中显示文件路径
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(provide 'init-gui-frames)
