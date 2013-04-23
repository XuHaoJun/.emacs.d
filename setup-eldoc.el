(require 'eldoc nil t)
(require 'eldoc-extension)

(setq eldoc-idle-delay 0.2)
(setq eldoc-echo-area-use-multiline-p t)
(setq eldoc-minor-mode-string "") ;hide ElDoc show at mode line

(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

(provide 'setup-eldoc)
