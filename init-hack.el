;; linum的背景色和linum下面的背景色不同
;; 设置linum的背景色和default的背景色一致
(custom-set-faces
 '(linum ((t (:inherit (shadow default) :background "#042028")))))

;; 加载yasnippet后刷新下缓存，不然会加载elpa里面的snippets
(after-load 'yasnippet
  (yas-reload-all))

;; 设置auto-complete的dict在原来的基础上加上auto-complete-dict
;; 其中存有一份dict/javascript-mode的拷贝，命名为js-mode
;; 解决auto-complete在js文件下无效
(setq ac-dictionary-directories (append ac-dictionary-directories '("~/.emacs.d/auto-complete-dict")))

(provide 'init-hack)
