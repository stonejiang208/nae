(require-package 'php-mode)

(setq php-mode-coding-style 'symfony2)

(defun php-comment-dwim (arg)
  "Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
  (interactive "*P")
  (require 'newcomment)
  (let (
        (comment-start "// ") (comment-end "")
        )
    (comment-dwim arg)))

;; 更改php注释类型
(add-hook 'php-mode-hook
          (lambda ()
            (define-key php-mode-map [remap comment-dwim] 'php-comment-dwim)
            (setq php-manual-path "~/.emacs.d/php-manual/")
              ))

(provide 'init-php)
