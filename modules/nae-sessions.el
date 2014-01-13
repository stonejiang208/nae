(setq desktop-path (list user-emacs-directory))
(desktop-save-mode 1)

(nae-require-package 'session)

(add-hook 'after-init-hook 'session-initialize)

(provide 'nae-sessions)
