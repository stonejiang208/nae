(nae-require-package 'w3m)

;; 开启按f键显示链接编号的功能
(w3m-lnum-mode)

(setq w3m-home-page "https://www.google.com.hk")
(setq w3m-default-display-inline-images t)
(setq w3m-use-cookies t)

;; 设置w3m为默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)

(provide 'nae-w3m)
