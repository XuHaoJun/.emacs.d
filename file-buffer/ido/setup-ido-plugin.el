(require 'ido-sort-mtime)
(ido-sort-mtime-mode 1)


(require 'smex) ; Use smex on M-x with ido style
(require 'setup-smex-basic)
(smex-initialize)


;; Use ido everywhere
(require 'ido-ubiquitous)
(ido-everywhere t)
(ido-ubiquitous-mode t)
(require 'setup-ido-ubiquitous-basic)


(require 'flx-ido)
(flx-ido-mode 1)


(require 'ido-yes-or-no)
(ido-yes-or-no-mode t)

(provide 'setup-ido-plugin)
