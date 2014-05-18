(eval-after-load 'package
  '(progn
     ;; use the standard Dired bindings as a base
     (defvar package-menu-mode-map)
     (evil-make-overriding-map package-menu-mode-map 'normal)))

(evil-set-initial-state 'term-mode       'emacs)
(evil-set-initial-state 'ansi-term       'emacs)
;; workaround for fix evil-leader enable on ibuffer-mode and package-menu-mode
(evil-set-initial-state 'ibuffer-mode    'normal)
(evil-set-initial-state 'package-menu-mode    'normal)

(provide 'setup-evil-integration)
