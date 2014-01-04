(require 'go-autocomplete)

(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-hook 'go-mode-hook
          (lambda ()
            (define-key evil-motion-state-local-map "gd" 'godef-jump)
            (define-key evil-motion-state-local-map "gD" 'godef-jump-other-window)))

(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'setup-go-mode)
