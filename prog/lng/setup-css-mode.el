(add-hook 'css-mode-hook
          (lambda ()
            (make-local-variable 'ac-fuzzy-enable)
            (setq ac-fuzzy-enable t)))

(add-hook 'css-mode-hook
          (lambda ()
            (progn (rainbow-mode)
                   (autopair-mode))))

(provide 'setup-css-mode)
