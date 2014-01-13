(nae-require-package 'vimrc-mode)

(add-to-list 'auto-mode-alist '("[.|_]\\(g\\)?vim\\(rc\\)?$" . vimrc-mode))

(provide 'nae-vimrc-mode)
