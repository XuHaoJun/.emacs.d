;; Depend on auto-complete rainbow-mode autopair-mode css-eldoc

(add-hook 'css-mode-hook
          (lambda ()
            (make-local-variable 'ac-fuzzy-enable)
            (setq ac-fuzzy-enable t)))

(add-hook 'css-mode-hook
          (lambda ()
            (rainbow-mode)
            (autopair-mode)))

(css-eldoc-enable)

(provide 'setup-css-mode)
