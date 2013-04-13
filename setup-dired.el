(require 'dired)

;; Recursive do copy or delete.
(setq dired-recursive-deletes t)
(setq dired-recursive-copies t)

;; Extends functionalities provided by GNU Emacs's dired.el
(require 'dired+)

;; Let dired can hide details
(require 'dired-details)
(require 'dired-details+)
(dired-details-install)
;; Default dired not hide details,i want to hand to enable.
(add-hook 'dired-mode-hook
          (lambda ()
            (dired-details-show)))

;; Hate dired gen too more buffer,let only one buffer.
(require 'dired-single)
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
            (define-key dired-mode-map (kbd "<mouse-1>") 'dired-single-buffer-mouse)
            (define-key dired-mode-map (kbd "^")
              (lambda ()
                (interactive)
                (dired-single-buffer "..")))))

;; Hide dotfiles and . like 'ls'
(add-hook 'dired-mode-hook
          (lambda ()
            (setq dired-omit-files "^#\\|^\\..*") ; omit all hidden file which starts with `.'
            (dired-omit-mode 1)))                 ; initially omit unintrested files

(provide 'setup-dired)
