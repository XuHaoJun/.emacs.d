;;; Require package: (geiser)
;;;
;;; Useage:
;;; Geiser is such as SLIME,and if you want auto completion(company)
;;; must start it M-x run-geiser.

(setq geiser-active-implementations '(racket))
(setq scheme-program-name "racket")

;; I use geiser's company completion,so disable it.
(add-hook 'scheme-mode-hook (lambda ()
                              (if (fboundp 'auto-complete-mode)
                                  (auto-complete-mode -1))
                              (define-key evil-motion-state-local-map "gd" 'geiser-edit-symbol-at-point)))

(add-hook 'geiser-repl-mode-hook 'smartparens-strict-mode)

(provide 'setup-scheme-mode)
