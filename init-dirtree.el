(require-package 'tree-mode)

(require 'dirtree)

(defun dirtree-projectile ()
  (interactive)
  (dirtree (projectile-project-root) t))

(defun dirtree-close ()
  (interactive)
  (kill-buffer-and-its-windows "*dirtree*"))

(defun dirtree-toggle ()
  (interactive)
  (if (get-buffer-window "*dirtree*")
      (delete-windows-on (get-buffer "*dirtree*"))
    (dirtree-projectile)))

(setq dirtree-windata '(frame right 40 delete))

(global-set-key (kbd "C-c d") 'dirtree-toggle)

(provide 'init-dirtree)
