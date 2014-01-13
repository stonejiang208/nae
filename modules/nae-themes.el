(nae-require-package 'color-theme-sanityinc-solarized)
(nae-require-package 'monokai-theme)

;; 默认主题 （monokai、sanityinc-inc-solarized-light、sanityinc-solarized-dark）
(setq-default custom-enabled-themes '(monokai))

;; 确保主题在没有配置主题的情况下也能启用
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

(provide 'nae-themes)
