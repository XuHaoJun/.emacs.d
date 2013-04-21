(require 'helm-config)
;; (helm-mode 1)

(require 'helm-c-moccur)
(global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
(add-hook 'dired-mode-hook
          '(lambda ()
             (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))

(provide 'setup-helm)
