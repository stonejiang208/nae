(setq visible-bell t)

(global-linum-mode t)
(column-number-mode t)
(global-visual-line-mode 1)
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

;; 不备份使用su或者sudo命令打开的文件，因此通过Tramp打开的文件不会被备份
;; 养成良好的习惯，进行重要文件操作前，手动备份
(setq backup-enable-predicate
      (lambda (name)
        (and (normal-backup-enable-predicate name)
             (not
              (let ((method (file-remote-p name 'method)))
                (when (stringp method)
                  (member method '("su" "sudo"))))))))

(setq-default show-trailing-whitespace t)

;; 某些mode不开启show-trailing-whitespace
(dolist (hook '(calendar-mode-hook
                comint-mode-hook
                completion-list-mode-hook
                elfeed-show-mode-hook
                elfeed-search-mode-hook
                package-menu-mode-hook
                shell-mode-hook
                term-mode-hook))
  (add-hook hook
            (lambda () (setq show-trailing-whitespace nil))))

(provide 'init-editing-utils)
