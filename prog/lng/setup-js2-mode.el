(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-hook 'js2-mode-hook (lambda ()
                           (slime-js-minor-mode 1)
                           (ac-js2-mode 1)
                           (rainbow-delimiters-mode 1)))

;; To add completions for external libraries add something like this:
;;
;; (add-to-list 'ac-js2-external-libraries "path/to/lib/library.js")
(add-hook 'js2-mode-hook
          (lambda ()
            (define-key evil-motion-state-local-map "gd" 'ac-js2-jump-to-definition)))

(provide 'setup-js2-mode)
