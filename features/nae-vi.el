(define-prefix-command 'vi-key-map)
(global-set-key (kbd "C-o") 'vi-key-map)

;; Autoindent open-*-lines
(defvar newline-and-indent t
  "Modify the behavior of the open-*-line functions to cause them to autoindent.")

;; 模仿vi的f
(defun jump-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `jump-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))

;; Behave like vi's o command
;; 取自 http://www.emacswiki.org/emacs/OpenNextLine
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
    See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

;; Behave like vi's O command
;; 取自 http://www.emacswiki.org/emacs/OpenNextLine
(defun open-previous-line (arg)
  "Open a new line before the current one.
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

(define-key vi-key-map (kbd "f") 'jump-to-char)
(define-key vi-key-map (kbd "o") 'open-next-line)
(define-key vi-key-map (kbd "O") 'open-previous-line)

(provide 'nae-vi)
