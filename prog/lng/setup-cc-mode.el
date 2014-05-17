;; require package: '(clang-formt google-c-style ggtags)
(require 'cc-mode)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(setq clang-format-style "google")

(defun setup-gtags-hook ()
  (ggtags-mode)
  (define-key evil-motion-state-local-map "gd" 'ggtags-find-tag-dwim))

(when (executable-find "gtags")
  (require 'gtags)
  (require 'ggtags)
  (add-hook 'c-mode-hook 'setup-gtags-hook)
  (add-hook 'c++-mode-hook 'setup-gtags-hook))

;;for work with auto-indent mode
(add-hook 'c-mode-common-hook
          (lambda () (setq indent-tabs-mode t)))

(provide 'setup-cc-mode)
