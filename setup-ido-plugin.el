(require 'ido-hacks)
(ido-hacks-mode t)


(require 'ido-sort-mtime)
(ido-sort-mtime-mode 1)


(require 'smex) ; Use smex on M-x with ido style
(smex-initialize)
(require 'setup-smex-basic)


;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-everywhere t)
(ido-ubiquitous-mode t)
(require 'ido-ubiquitous-basic)


(require 'ido-yes-or-no)
(ido-yes-or-no-mode t)

(provide 'setup-ido-plugin)
