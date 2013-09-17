(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path (expand-file-name "local/" user-emacs-directory))

(setq exec-path (append exec-path '("/usr/local/bin/")))


(require 'init-utils)
(require 'init-elpa)

(require 'init-themes)
(require 'init-key-bindings)
(require 'init-gui-frames)

(require 'init-dirtree)
(require 'init-dired)
(require 'init-ibuffer)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-auto-complete)

(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-windows)
(require 'init-sessions)
(require 'init-git)

(require 'init-editing-utils)

(require 'init-c)
(require 'init-php)
(require 'init-org)
(require 'init-slime)

(require 'init-gnus)
(require 'init-w3m)

(require 'init-misc)

;; Customize Emacs所自动生成的配置
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
