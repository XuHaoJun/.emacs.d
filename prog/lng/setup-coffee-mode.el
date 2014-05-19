(custom-set-variables '(coffee-tab-width 2))

(add-hook 'coffee-mode-hook (lambda ()
                              (make-local-variable 'evil-auto-indent)
                              (setq evil-auto-indent nil)))

(provide 'setup-coffee-mode)
