;; 2013.8

(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (expand-file-name "local/" user-emacs-directory))

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
(require 'init-auto-complete)
(require 'init-helm)
(require 'init-yasnippet)

(require 'init-ido)
(require 'init-bookmark)
(require 'init-hippie-expand)
(require 'init-windows)
(require 'init-sessions)
(require 'init-git)

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

(require 'init-key-bindings)

(require 'init-local)
(require 'init-hack)

(require 'init-locales)

;; 开启server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Customize Emacs所自动生成的配置
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
