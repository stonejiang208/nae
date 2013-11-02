(dir-locals-set-class-variables 'wordpress
                                '((web-mode . ((eval . (progn (my-set-web-mode-indentation 4)
                                                              (setq indent-tabs-mode t)))))
                                  (php-mode . ((eval . (progn (web-mode)
                                                              (my-set-web-mode-indentation 4)
                                                              (setq indent-tabs-mode t)))))))

;; 使改变major mode后directory variables仍能生效
;; http://stackoverflow.com/questions/19280851/how-to-keep-dir-local-variables-when-switching-major-modes
(defvar my-hack-local-variables-after-major-mode-change t
  "Whether to process local variables after a major mode change.
Disabled by advice if the mode change is triggered by `normal-mode',
as local variables are processed automatically in that instance.")

(defadvice normal-mode (around my-do-not-hack-local-variables-twice)
  "Prevents `after-change-major-mode-hook' from processing local variables.
See `my-after-change-major-mode-hack-local-variables'."
  (let ((my-hack-local-variables-after-major-mode-change nil))
    ad-do-it))
(ad-activate 'normal-mode)

(add-hook 'after-change-major-mode-hook
          'my-after-change-major-mode-hack-local-variables)

(defun my-after-change-major-mode-hack-local-variables ()
  "Callback function for `after-change-major-mode-hook'."
  (when my-hack-local-variables-after-major-mode-change
    (hack-local-variables)))

(provide 'init-dir-locals)
