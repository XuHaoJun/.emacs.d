(require 'dired)

;; Recursive do copy or delete.
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote always))

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
(require 'dired-x)
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))

(require 'wdired)
(define-key dired-mode-map "\C-c\C-i" 'wdired-change-to-wdired-mode)

(provide 'setup-dired)
