;;; nae-web-mode.el --- part of NAE
;;
;; Copyright (C) 2013-2014 hellobear
;;
;; Author: hellobear <i@hellobear.net>
;; URL: https://github.com/hellobear/nae
;; Keywords: convenience

;; This file is not part of GNU Emacs.

;;; Commentary:

;; nae-web-mode.el of NAE

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

(nae-require-package 'web-mode)

(defun nae-set-web-mode-indentation (indentation)
  (setq web-mode-markup-indent-offset indentation
        web-mode-css-indent-offset indentation
        web-mode-code-indent-offset indentation
        web-mode-style-padding indentation
        web-mode-script-padding indentation))

(nae-set-web-mode-indentation 2)

(setq web-mode-block-padding 0)
(setq web-mode-disable-auto-pairing t)
(setq web-mode-indent-style 2)

;; html文件也用web-mode来编辑
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (memq nae-php-mode-coding-style '(codeigniter))
              (yas-activate-extra-mode (intern (concat (symbol-name nae-php-mode-coding-style) "-mode"))))))

(provide 'nae-web-mode)

;;; nae-web-mode.el ends here
