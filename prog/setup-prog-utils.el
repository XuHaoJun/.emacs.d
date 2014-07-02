;; highlight-symbol mode
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)

(eval-after-load 'highlight-symbol
  '(diminish 'highlight-symbol-mode))

(add-hook 'prog-mode-hook 'turn-on-fic-mode)
(eval-after-load 'fic-mode
  '(diminish 'fic-mode))

(provide 'setup-prog-utils)
