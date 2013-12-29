;; BASH programmable completion
(require 'bash-completion)
(bash-completion-setup)

;; 值加上"-i"令通过M-!执行shell命令使用interactive shell，默认的值为"-c"
;; 因此M-!可以执行.bash_profile中的alias，alias只能在interactive shell中执行
;; 注意：http://stackoverflow.com/a/17595062，按以下设置会导致auto-complete变慢
;; (setq shell-command-switch "-ic")

;; 清楚shell所有output
(defun clear-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))

;; eshell清屏
(defun eshell/clear ()
  "Clears the shell buffer ala Unix's clear or DOS' cls"
  (interactive)
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
    ;; simply delete the region
    (delete-region (point-min) (point-max))))

;; zsh后缀的文件开启sh-mode
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-hook 'sh-mode-hook
          (lambda ()
            (if (string-match "\\.zsh$" buffer-file-name)
                (sh-set-shell "zsh"))))

(provide 'init-shell)
