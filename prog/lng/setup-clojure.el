;; require package (clojure-mode cider ac-nrepl)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq cider-repl-use-clojure-font-lock t)

;; (require 'ac-nrepl)
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(provide 'setup-clojure)
