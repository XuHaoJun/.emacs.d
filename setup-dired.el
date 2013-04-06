(require 'dired)
(require 'dired-details)
(require 'dired-details+)
(dired-details-install)

;; Hide dotfiles like 'ls' default
(add-hook 'dired-mode-hook
          (lambda ()
            (setq dired-omit-files "^#\\|^\\..*") ; omit all hidden file which starts with `.'
            (dired-omit-mode 1)))                 ; initially omit unintrested files


(provide 'setup-dired)
