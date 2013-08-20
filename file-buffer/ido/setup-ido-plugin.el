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


(require 'ido-preview)
(add-hook 'ido-setup-hook
  (lambda()
    (define-key ido-completion-map (kbd "C-M-p") (lookup-key ido-completion-map (kbd "C-p")))
    (define-key ido-completion-map (kbd "C-M-n") (lookup-key ido-completion-map (kbd "C-n"))) ; currently, this makes nothing. Maybe they'll make C-n key lately.
    (define-key ido-completion-map (kbd "C-p") 'ido-preview-backward)
    (define-key ido-completion-map (kbd "C-n") 'ido-preview-forward)))

(provide 'setup-ido-plugin)
