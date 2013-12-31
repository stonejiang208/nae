(setq c-default-style "k&r"
      c-basic-offset 4)

(add-hook 'c-mode-hook (lambda ()
                         (setq comment-start "// " comment-end "")))

(provide 'init-c)
