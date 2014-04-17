;; highlight-symbol mode
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)

(eval-after-load 'highlight-symbol
  '(diminish 'highlight-symbol-mode))

(provide 'setup-prog-utils)
