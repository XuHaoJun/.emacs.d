;; require package: '(clang-formt google-c-style)
(require 'cc-mode)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(setq clang-format-style "google")

(defun setup-gtags-hook ()
  (gtags-mode)
  (define-key evil-motion-state-local-map "gd" 'gtags-find-tag-from-here))

(when (executable-find "gtags")
  (require 'gtags)
  (add-hook 'c-mode-hook 'setup-gtags-hook)
  (add-hook 'c++-mode-hook 'setup-gtags-hook))


;;for work with auto-indent mode
(add-hook 'c-mode-common-hook
          (lambda () (setq indent-tabs-mode t)))

(provide 'setup-cc-mode)
