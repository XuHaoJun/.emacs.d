(require 'multi-term)

(setq multi-term-program "/bin/zsh")
(setq multi-term-dedicated-select-after-open-p t)
(setq multi-term-dedicated-window-height 17)
(setq multi-term-dedicated-max-window-height 25)
(setq term-bind-key-alist nil)
(setq term-unbind-key-list nil)

(global-set-key (kbd "C-<f9>") 'multi-term-dedicated-toggle)
(global-set-key (kbd "M-<f9>") 'multi-term)

(provide 'setup-multi-term)
