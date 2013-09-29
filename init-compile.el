(require-package 'smart-compile)

(after-load 'smart-compile
  (add-to-list 'smart-compile-alist
               '("\\.c\\'" . "gcc -Wall -O2 %f -lm -o %n")))

;; 有待改进
(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (search-forward "warning" nil t))))
      (run-with-timer 1 nil
                      (lambda (buf)
                        (bury-buffer buf)
                        (switch-to-prev-buffer (get-buffer-window buf) 'kill))
                      buffer)))
;; 编译后如果没有错误或警告则隐藏*compilation*
;; (add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

(provide 'init-compile)
