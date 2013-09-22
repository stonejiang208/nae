(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (expand-file-name "local/" user-emacs-directory))

(setq exec-path (append exec-path '("/usr/local/bin/")))


(require 'init-utils)
(require 'init-elpa)
(require 'init-themes)

(require 'init-gui-frames)

(require 'init-tramp)

(require 'init-dired)
(require 'init-ibuffer)
(require 'init-projectile)
(require 'init-flycheck)
;; (require 'init-flyspell)
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

(require 'init-c)
(require 'init-php)
(require 'init-org)
(require 'init-slime)
(require 'init-emmet)
(require 'init-multi-web-mode)
(require 'init-vimrc-mode)

(require 'init-shell)
(require 'init-gnus)
(require 'init-w3m)
(require 'init-douban-fm)

(require 'init-misc)

(require 'init-key-bindings)

(require 'init-local)
(require 'init-hack)

;; 开启server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Customize Emacs所自动生成的配置
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
