(nae-require-package 'slime)

(setq inferior-lisp-program "/usr/local/Cellar/clozure-cl/1.9/bin/ccl64")
(setq common-lisp-hyperspec-root "/Users/dongxiong/.emacs.d/HyperSpec-7-0/HyperSpec/")

(slime-setup '(slime-repl))

(provide 'nae-slime)
