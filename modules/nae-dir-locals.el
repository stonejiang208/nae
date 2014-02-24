;;; nae-dir-locals.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <ihellobear@gmail.com>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-dir-locals.el of NAE

;;; License:

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(dir-locals-set-class-variables 'yy
                                '((php-mode . ((eval . (progn (php-enable-symfony2-coding-style)
                                                              (setq flycheck-php-phpcs-executable "phpcs")
                                                              (setq flycheck-phpcs-standard "PSR2")))))))

(dir-locals-set-class-variables 'wordpress
                                '((web-mode . ((eval . (progn (nae-set-web-mode-indentation 4)
                                                              (setq indent-tabs-mode t)))))
                                  (php-mode . ((eval . (progn (web-mode)
                                                              (nae-set-web-mode-indentation 4)
                                                              (setq indent-tabs-mode t)))))))

(dir-locals-set-class-variables 'creuse
                                '((php-mode . ((eval . (progn (php-enable-symfony2-coding-style)
                                                              (setq flycheck-php-phpcs-executable "/Applications/MAMP/bin/php/php5.4.10/bin/phpcs")
                                                              (setq flycheck-phpcs-standard "PSR2")))))))

(dir-locals-set-class-variables 'yyadmin
                                '((php-mode . ((eval . (progn (nae-php-enable-coding-style 'codeigniter)
                                                              (setq indent-tabs-mode nil)))))))

(dir-locals-set-class-variables 'thrift-php-lib
                                '((php-mode . ((eval . (progn (setq tab-width 2)
                                                              (setq c-basic-offset 2)))))))

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

;;; nae-dir-locals.el ends here
