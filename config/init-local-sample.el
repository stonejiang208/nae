;; 在本地将该文件命名为init-local.el

;; youdao翻译
(require 'youdao)

(setf youdao-key-from "youdao-key-from")
(setf youdao-key "youdao-key")

(setq shell-file-name "/bin/bash")

;; 设定emacsclient路径
(setq magit-emacsclient-executable "emacsclient-path")

(provide 'init-local)
