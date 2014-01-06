(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; 删除buffer及其window
;; http://www.emacswiki.org/emacs/misc-cmds.el
(defun kill-buffer-and-its-windows (buffer)
  "Kill BUFFER and delete its windows.  Default is `current-buffer'.
BUFFER may be either a buffer or its name (a string)."
  (interactive (list (read-buffer "Kill buffer: " (current-buffer) 'existing)))
  (setq buffer  (get-buffer buffer))
  (if (buffer-live-p buffer)            ; Kill live buffer only.
      (let ((wins  (get-buffer-window-list buffer nil t))) ; On all frames.
        (when (and (buffer-modified-p buffer)
                   (fboundp '1on1-flash-ding-minibuffer-frame))
          (1on1-flash-ding-minibuffer-frame t)) ; Defined in `oneonone.el'.
        (when (kill-buffer buffer)      ; Only delete windows if buffer killed.
          (dolist (win  wins)           ; (User might keep buffer if modified.)
            (when (window-live-p win)
              ;; Ignore error, in particular,
              ;; "Attempt to delete the sole visible or iconified frame".
              (condition-case nil (delete-window win) (error nil))))))
    (when (interactive-p)
      (error "Cannot kill buffer.  Not a live buffer: `%s'" buffer))))

;; 删除当前文件及buffer
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

;; 重命名当前文件及buffer
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file filename new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))

;; 切换至*scratch*，如果*scratch*不存在，新建之
;; http://stackoverflow.com/questions/234963/re-open-scratch-buffer-in-emacs
(defun switch-buffer-scratch ()
  "Switch to the scratch buffer. If the buffer doesn't exist,
create it and write the initial message into it."
  (interactive)
  (let* ((scratch-buffer-name "*scratch*")
         (scratch-buffer (get-buffer scratch-buffer-name)))
    (unless scratch-buffer
      (setq scratch-buffer (get-buffer-create scratch-buffer-name))
      (with-current-buffer scratch-buffer
        (lisp-interaction-mode)
        (insert initial-scratch-message)))
    (switch-to-buffer scratch-buffer)))

;; 按DEL键的时候删除一个tab或者一个tab宽度的空格
;; http://stackoverflow.com/questions/1450169/how-do-i-emulate-vims-softtabstop-in-emacs
(defun backward-delete-whitespace-to-column ()
  "delete back to the previous column of whitespace, or as much whitespace as possible,
or just one char if that's not possible"
  (interactive)
  (if indent-tabs-mode
      (call-interactively 'backward-delete-char)
    (let ((movement (% (current-column) tab-width))
          (p (point)))
      (when (= movement 0) (setq movement tab-width))
      (save-match-data
        (if (string-match "\\w*\\(\\s-+\\)$" (buffer-substring-no-properties (- p movement) p))
            (backward-delete-char-untabify (- (match-end 1) (match-beginning 1)))
        (call-interactively 'backward-delete-char-untabify))))))

(defun my-delete-backward-char (n &optional killflag)
  (interactive "p\nP")
  (unless (integerp n)
    (signal 'wrong-type-argument (list 'integerp n)))
  (cond ((and (use-region-p)
          delete-active-region
          (= n 1))
     ;; If a region is active, kill or delete it.
     (if (eq delete-active-region 'kill)
         (kill-region (region-beginning) (region-end))
       (delete-region (region-beginning) (region-end))))
    ;; In Overwrite mode, maybe untabify while deleting
    ((null (or (null overwrite-mode)
           (<= n 0)
           (memq (char-before) '(?\t ?\n))
           (eobp)
           (eq (char-after) ?\n)))
     (let ((ocol (current-column)))
           (delete-char (- n) killflag)
       (save-excursion
         (insert-char ?\s (- ocol (current-column)) nil))))
    ;; Otherwise, do simple deletion.
    ;; (t (delete-char (- n) killflag))))
    ;; 这里没用到killflag标志，后期熟悉elisp后再修改
    ;; backward-delete-whitespace-to-column使其支持killflag参数
    (t (backward-delete-whitespace-to-column))))

;; 删除除了当前光标所在行以外的行的行末空白
;; 修改自 http://stackoverflow.com/q/3533703
(defun delete-trailing-whitespace-except-current-line (region-start region-end)
  ;; (interactive)
  (let ((cur-line-begin (line-beginning-position))
        (cur-line-end (line-end-position)))
    (save-excursion
      ;; 必须先删除当前行以下的行的行末空格后再删除当前行以上的行的行末空格，原因是
      ;; 先删除了当前行以上的行的行末空格后cur-line-end的值不应该还是原来的值
      (when (> (point-max) cur-line-end)
        (save-restriction
          (narrow-to-region (1+ cur-line-end) region-end)
          (delete-trailing-whitespace)))
      (when (< (point-min) cur-line-begin)
        (save-restriction
          (narrow-to-region region-start (1- cur-line-begin))
          (delete-trailing-whitespace))))))

;; 根据point得到point在哪一行
(defun nae-point-at-line (point)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char point)
      (beginning-of-line)
      (1+ (count-lines 1 (point))))))

;; 得到某一行行首的point
(defun nae-line-beg-point (line)
  (save-restriction
    (widen)
    (save-excursion
      (goto-line line)
      (beginning-of-line)
      (point))))

;; 得到某一行行末的point
(defun nae-line-end-point (line)
  (save-restriction
    (widen)
    (save-excursion
      (goto-line line)
      (end-of-line)
      (point))))

(provide 'nae-utils)
