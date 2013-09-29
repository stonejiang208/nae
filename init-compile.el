(require-package 'smart-compile)

(after-load 'smart-compile
  (add-to-list 'smart-compile-alist
               '("\\.c\\'" . "gcc -Wall -O2 %f -lm -o %n")))

(provide 'init-compile)
