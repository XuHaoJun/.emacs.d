;;; Require package: (haskell-mode)
;;;

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

;; Disable all about auto-indent on haskell-mode
(add-hook 'haskell-mode-hook (lambda ()
                               ;; (ad-disable-advice 'evil-insert 'after 'evil-insert-state)
                               ;; (ad-activate 'evil-insert)
                               (setq evil-auto-indent nil)))


(provide 'setup-haskell)
