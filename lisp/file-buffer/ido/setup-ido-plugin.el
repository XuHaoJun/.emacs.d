;;; Require package:
;;; (ido-sort-mtime smex ido-ubiquitous ido-yes-or-no ido-preview
;;; flx-ido ido-vertical-mode)
;;; Require site-lisp:
;;; (ido-preview)

(require 'setup-smex)

(flx-ido-mode 1)

(ido-sort-mtime-mode 1)

(ido-vertical-mode t)

;; Use ido everywhere
(setq ido-everywhere t)
(ido-ubiquitous-mode t)

;; Bind ido-preview
(add-hook 'ido-setup-hook
  (lambda()
    (define-key ido-completion-map (kbd "C-M-p") (lookup-key ido-completion-map (kbd "C-p")))
    (define-key ido-completion-map (kbd "C-M-n") (lookup-key ido-completion-map (kbd "C-n"))) ; currently, this makes nothing. Maybe they'll make C-n key lately.
    (define-key ido-completion-map (kbd "C-p") 'ido-preview-backward)
    (define-key ido-completion-map (kbd "C-n") 'ido-preview-forward)))

(provide 'setup-ido-plugin)
