(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook (lambda ()
                           (slime-js-minor-mode 1)
                           (ac-js2-mode 1)))


(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(provide 'setup-js2-mode)
