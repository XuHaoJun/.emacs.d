;;; Require package: (auto-complete rainbow-mode autopair-mode css-eldoc helm-css-scss)

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
