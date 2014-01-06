;; 设置auto-complete的dict在原来的基础上加上auto-complete-dict
;; 其中存有一份dict/javascript-mode的拷贝，命名为js-mode
;; 解决auto-complete在js文件下无效
(if (boundp 'ac-dictionary-directories)
    (setq ac-dictionary-directories (append ac-dictionary-directories '("~/.emacs.d/auto-complete-dict"))))

(provide 'nae-hack)
