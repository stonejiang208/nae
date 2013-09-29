(setq c-default-style "k&r"
      c-basic-offset 4)

(add-hook 'c-mode-hook (lambda ()
                         (setq comment-start "// " comment-end "")))

(require-package 'smart-compile)

(after-load 'smart-compile
  (add-to-list 'smart-compile-alist
               '("\\.c\\'"          . "gcc -Wall -O2 %f -lm -o %n")))

(provide 'init-c)
