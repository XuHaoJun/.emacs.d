(require 'evil)
(require 'evil-jumper)
(require 'evil-visualstar)
(require 'evil-ruby-block-object)
(require 'surround)

(require 'setup-evil-basic)
(require 'setup-evil-leader)
(require 'setup-evil-acejump)
(require 'setup-evil-matchit)
(require 'setup-evil-integration)

(evil-mode t)
(global-surround-mode 1)

(provide 'setup-evil-init)
