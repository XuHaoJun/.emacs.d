;;; Require package: (geiser)
;;;
;;; Useage:
;;; Geiser is such as SLIME,and if you want auto completion(company)
;;; must start it M-x run-geiser.

(setq geiser-active-implementations '(racket))
(setq scheme-program-name "racket")

;; I use geiser's company completion,so disable it.
(add-hook 'scheme-mode-hook (lambda () (auto-complete-mode -1)))

(provide 'setup-scheme-mode)
