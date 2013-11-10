(eval-after-load 'ido-mode (require 'helm-mode))
(require 'helm-config)
(require 'helm-ack)
(require 'helm-ag)
(require 'helm-rails)
(require 'helm-projectile)
;; (helm-mode 1)

(setq-default helm-samewindow nil)
(setq-default helm-M-x-requires-pattern 0)

(global-set-key (kbd "C-x B") 'helm-mini)

(require 'helm-c-moccur)
(global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))

(provide 'setup-helm)
