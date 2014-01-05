(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "features" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "vendor" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-gui* (if window-system t nil))

(setq user-full-name "hellobear")
(setq user-login-name "hellobear")
(setq user-mail-address "hellobear@foxmail.com")

;; 彩蛋
(defconst wq! "Damn you! I am not vi!  Use C-x C-c instead.")

(require 'nae-utils)
(require 'nae-packages)
(require 'nae-themes)
;; (require 'nae-exec-path)

(require 'nae-gui-frames)

(require 'nae-tramp)

(require 'nae-dired)
(require 'nae-ibuffer)
(require 'nae-isearch)
(require 'nae-projectile)
(require 'nae-flycheck)
;; (require 'nae-flyspell)
(require 'nae-compile)
(require 'nae-yasnippet)
(require 'nae-auto-complete)
(require 'nae-helm)

(require 'nae-ido)
(require 'nae-bookmark)
(require 'nae-hippie-expand)
(require 'nae-windows)
(require 'nae-sessions)
(require 'nae-git)

;; (require 'nae-autopair)
(require 'nae-editing-utils)

(require 'nae-web-mode)
(require 'nae-c)
(require 'nae-php)
(require 'nae-org)
(require 'nae-slime)
(require 'nae-emmet)
(require 'nae-vimrc-mode)
(require 'nae-thrift)

(require 'nae-shell)
;; (require 'nae-w3m)
(require 'nae-rss)
(require 'nae-douban-fm)
(require 'nae-calendar)

(require 'nae-misc)
(require 'nae-dir-locals)

(require 'nae-key-bindings)

(require 'nae-hack)

(require 'nae-locales)

;; 开启server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Customize Emacs所自动生成的配置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; 本地配置
(require 'nae-local nil t)
