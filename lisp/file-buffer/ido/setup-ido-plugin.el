;;; Require package:
;;; (ido-sort-mtime smex ido-ubiquitous ido-yes-or-no
;;; flx-ido ido-vertical-mode)

(require 'setup-smex)

(flx-ido-mode 1)

(ido-sort-mtime-mode 1)

(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

;; Use ido everywhere
(setq ido-everywhere t)
(ido-ubiquitous-mode t)

(provide 'setup-ido-plugin)
