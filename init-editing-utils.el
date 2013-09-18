(setq visible-bell t)

(global-linum-mode t)

(column-number-mode t)

(setq-default indent-tabs-mode nil)

;; 显示括号匹配, 而不是匹配后短暂的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; 左括号在可见范围之外时，输入右括号会在minibuffer显示左括号附近的内容
(setq blink-matching-paren t)

;; undo-tree
(require-package 'undo-tree)
(global-undo-tree-mode 1)

;; 只在替换时大小写敏感
(defadvice replace-string (around turn-off-case-fold-search)
  (let ((case-fold-search nil))
    ad-do-it))

(ad-activate 'replace-string)

;; 所有备份文件都转存到 ~/.emacs.d/backup 中
(defun my-backup-file-name (fpath)
  (let* (
         (backupRootDir "~/.emacs.d/backup/")
         (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath ))
         (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") ))
         )
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath
    )
  )

(setq make-backup-file-name-function 'my-backup-file-name)

(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; 回车自动缩进
(define-key global-map (kbd "RET") 'newline-and-indent)

;; (setq-default show-trailing-whitespace t)

(provide 'init-editing-utils)
