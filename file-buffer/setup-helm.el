(require 'helm-config)
(require 'helm-ack)
(require 'helm-ag)
;; (helm-mode 1)

(global-set-key (kbd "C-x B") 'helm-mini)

(require 'helm-c-moccur)
(global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))

(provide 'setup-helm)
