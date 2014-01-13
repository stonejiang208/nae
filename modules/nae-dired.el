(nae-require-package 'dired+)

(put 'dired-find-alternate-file 'disabled nil)

;; 回车不新建dired buffer
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "<return>")
              'dired-find-alternate-file)
            (define-key dired-mode-map (kbd "^")
              (lambda () (interactive) (find-alternate-file "..")))))

(after-load 'dired
  (require 'dired+))

(provide 'nae-dired)
