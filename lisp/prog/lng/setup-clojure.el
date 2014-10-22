;; require package (clojure-mode cider kibit-mode)

(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(defun clojure-mysetup ()
  (rainbow-delimiters-mode 1)
  (smartparens-strict-mode 1))

(add-hook 'clojure-mode-hook 'clojure-mysetup)

(defun cider-repl-mysetup ()
  (rainbow-delimiters-mode 1)
  (smartparens-strict-mode 1)
  (define-key evil-normal-state-local-map "gd" 'cider-jump)
  (define-key evil-normal-state-local-map "gD" 'cider-jump-back)
  (define-key evil-normal-state-local-map (kbd "RET") 'cider-repl-return))

(add-hook 'cider-repl-mode-hook 'cider-repl-mysetup)


(defun cider-mysetup ()
  (define-key evil-normal-state-local-map "gd" 'cider-jump)
  (define-key evil-normal-state-local-map "gD" 'cider-jump-back))

(add-hook 'cider-mode-hook 'cider-mysetup)

(provide 'setup-clojure)
