(require 'smartparens-config)

(add-hook 'scheme-mode-hook 'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook 'smartparens-strict-mode)
(add-hook 'lisp-mode-hook 'smartparens-strict-mode)

(provide 'setup-smartparens)
