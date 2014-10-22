;;; Require package: (scss-mode)

(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

(provide 'setup-scss-mode)
