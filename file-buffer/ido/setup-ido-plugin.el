;;; Require package:
;;; (ido-sort-mtime smex ido-ubiquitous ido-yes-or-no ido-preview
;;; flx-ido)
;;; Require site-lisp:
;;; (ido-preview)

(ido-sort-mtime-mode 1)


(require 'setup-smex-basic)
(smex-initialize)


;; Use ido everywhere
(ido-everywhere t)
(ido-ubiquitous-mode t)
(require 'setup-ido-ubiquitous-basic)


(flx-ido-mode 1)


(ido-yes-or-no-mode t)


(require 'ido-preview)
(add-hook 'ido-setup-hook
  (lambda()
    (define-key ido-completion-map (kbd "C-M-p") (lookup-key ido-completion-map (kbd "C-p")))
    (define-key ido-completion-map (kbd "C-M-n") (lookup-key ido-completion-map (kbd "C-n"))) ; currently, this makes nothing. Maybe they'll make C-n key lately.
    (define-key ido-completion-map (kbd "C-p") 'ido-preview-backward)
    (define-key ido-completion-map (kbd "C-n") 'ido-preview-forward)))

(provide 'setup-ido-plugin)
