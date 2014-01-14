(defvar nae-dir user-emacs-directory)
(defvar nae-core-dir (expand-file-name "core" nae-dir))
(defvar nae-modules-dir (expand-file-name  "modules" nae-dir))
(defvar nae-vendor-dir (expand-file-name  "vendor" nae-dir))
(defvar nae-custom-dir (expand-file-name "custom" nae-dir))

(add-to-list 'load-path nae-dir)
(add-to-list 'load-path nae-core-dir)
(add-to-list 'load-path nae-modules-dir)
(add-to-list 'load-path nae-vendor-dir)
(add-to-list 'load-path nae-custom-dir)

(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-gui* (if window-system t nil))

;; 彩蛋
(defconst wq! "Damn you! I am not vi!  Use C-x C-c instead.")

(require 'nae-packages)

(load "nae-modules")

;; 开启server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Customize Emacs所自动生成的配置
(setq custom-file (expand-file-name "custom.el" nae-custom-dir))
(when (file-exists-p custom-file)
  (load custom-file))

;; 本地配置
(require 'local nil t)
