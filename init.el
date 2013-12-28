;; 2013.8

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "local" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-gui* (if window-system t nil))

;; 彩蛋
(defconst wq! "Damn you! I am not vi!  Use C-x C-c instead.")

(require 'init-utils)
(require 'init-elpa)
(require 'init-themes)
(require 'init-exec-path)

(require 'init-gui-frames)

(require 'init-tramp)

(require 'init-dired)
(require 'init-ibuffer)
(require 'init-isearch)
(require 'init-projectile)
(require 'init-flycheck)
;; (require 'init-flyspell)
(require 'init-compile)
(require 'init-yasnippet)
(require 'init-auto-complete)
(require 'init-helm)

(require 'init-ido)
(require 'init-bookmark)
(require 'init-hippie-expand)
(require 'init-windows)
(require 'init-sessions)
(require 'init-git)

(require 'init-autopair)
(require 'init-editing-utils)

(require 'init-web-mode)
(require 'init-c)
(require 'init-php)
(require 'init-org)
(require 'init-slime)
(require 'init-emmet)
(require 'init-vimrc-mode)

(require 'init-shell)
(require 'init-w3m)
(require 'init-rss)
(require 'init-douban-fm)
(require 'init-calendar)

(require 'init-misc)
(require 'init-dir-locals)

(require 'init-key-bindings)

(require 'init-hack)

(require 'init-locales)

;; 开启server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Customize Emacs所自动生成的配置
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; 本地配置
(require 'init-local nil t)
