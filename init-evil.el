; evil
(require-package 'evil)

(evil-mode 1)

(setq evil-intercept-maps nil)
(setq evil-overriding-maps nil)

; 让所有默认以 emacs-state 启动的 buffer 以 normal-state 启动
(setq evil-normal-state-modes (append evil-emacs-state-modes evil-normal-state-modes))
(setq evil-emacs-state-modes nil)

; evil-nerd-commenter
(require-package 'evil-nerd-commenter)

(evilnc-default-hotkeys)

(defun evilnc-default-hotkeys ()
  (interactive)
  (global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
  (global-set-key (kbd "M-:") 'evilnc-comment-or-uncomment-to-the-line)
  (global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
  (global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)
  (eval-after-load 'evil
       (define-key evil-normal-state-map ",ci" 'evilnc-comment-or-uncomment-lines)
       (define-key evil-normal-state-map ",cl" 'evilnc-comment-or-uncomment-to-the-line)
       (define-key evil-normal-state-map ",cc" 'evilnc-copy-and-comment-lines)
       (define-key evil-normal-state-map ",cp" 'evilnc-comment-or-uncomment-paragraphs)
       (define-key evil-normal-state-map ",cr" 'comment-or-uncomment-region)
       (define-key evil-normal-state-map ",," 'evilnc-comment-operator)
       (define-key evil-visual-state-map ",," 'evilnc-comment-operator)
       ))

(provide 'init-evil)
