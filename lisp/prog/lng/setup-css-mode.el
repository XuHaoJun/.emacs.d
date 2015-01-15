;;; Require package: (rainbow-mode autopair-mode css-eldoc helm-css-scss)

(add-hook 'css-mode-hook
          (lambda ()
            (rainbow-mode)
            (autopair-mode)))

(css-eldoc-enable)

(provide 'setup-css-mode)
