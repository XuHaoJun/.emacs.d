(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(setq ac-js2-evaluate-calls t)
(defun setup-js2-mode-hook ()
  (ac-js2-mode)
  (auto-complete-mode -1)
  (skewer-mode)
  (rainbow-delimiters-mode)
  (define-key evil-motion-state-local-map "gd" 'ac-js2-jump-to-definition))

(add-hook 'js2-mode-hook 'setup-js2-mode-hook)

;; To add completions for external libraries add something like this:
;;
;; (add-to-list 'ac-js2-external-libraries "path/to/lib/library.js")

(provide 'setup-js2-mode)
