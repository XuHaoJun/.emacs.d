;; require package: '(clang-formt google-c-style)
(require 'cc-mode)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(setq clang-format-style "google")

(when (executable-find "gtags")
  (require 'gtags)
  (add-hook 'c-mode-hook 'gtags-mode)
  (add-hook 'c++-mode-hook 'gtags-mode))

;;for work with auto-indent mode
(add-hook 'c-mode-common-hook
          (lambda () (setq indent-tabs-mode t)))

(provide 'setup-cc-mode)
