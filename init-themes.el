(require-package 'color-theme-sanityinc-solarized)

;; 默认主题solarized深色
(setq-default custom-enabled-themes '(sanityinc-solarized-dark))

;; 确保主题在没有配置主题的情况下也能启用
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

(provide 'init-themes)
