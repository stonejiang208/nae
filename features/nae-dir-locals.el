(dir-locals-set-class-variables 'wordpress
                                '((web-mode . ((eval . (progn (nae-set-web-mode-indentation 4)
                                                              (setq indent-tabs-mode t)))))
                                  (php-mode . ((eval . (progn (web-mode)
                                                              (nae-set-web-mode-indentation 4)
                                                              (setq indent-tabs-mode t)))))))

(dir-locals-set-class-variables 'creuse
                                '((php-mode . ((eval . (progn (php-enable-symfony2-coding-style)))))))

(dir-locals-set-directory-class "/Applications/MAMP/htdocs/Creuse/" 'creuse)
(dir-locals-set-directory-class "~/Emacs/" 'creuse)

;; 使改变major mode后directory variables仍能生效
;; 见 http://stackoverflow.com/a/19295380
;; @TODO 理解nae-do-not-hack-local-variables-twice，原来的是
;; my-do-not-hack-local-variables-twice
(defvar nae-hack-local-variables-after-major-mode-change t
  "Whether to process local variables after a major mode change.
Disabled by advice if the mode change is triggered by `normal-mode',
as local variables are processed automatically in that instance.")

(defadvice normal-mode (around nae-do-not-hack-local-variables-twice)
  "Prevents `after-change-major-mode-hook' from processing local variables.
See `nae-after-change-major-mode-hack-local-variables'."
  (let ((nae-hack-local-variables-after-major-mode-change nil))
    ad-do-it))
(ad-activate 'normal-mode)

(add-hook 'after-change-major-mode-hook
          'nae-after-change-major-mode-hack-local-variables)

(defun nae-after-change-major-mode-hack-local-variables ()
  "Callback function for `after-change-major-mode-hook'."
  (when nae-hack-local-variables-after-major-mode-change
    (hack-local-variables)))

(provide 'nae-dir-locals)
