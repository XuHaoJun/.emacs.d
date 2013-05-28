(require 'smartparens-config)

(add-hook 'scheme-mode-hook 'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'lisp-mode-hook 'smartparens-mode)

(provide 'setup-smartparens)
