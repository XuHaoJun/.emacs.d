(eval-after-load 'package
  '(progn
     (defvar package-menu-mode-map)
     (evil-make-overriding-map package-menu-mode-map 'normal)))

(eval-after-load 'help-mode
  '(progn
     (defvar help-mode-map)
     (evil-make-overriding-map help-mode-map 'normal)))

(evil-set-initial-state 'term-mode     'emacs)
(evil-set-initial-state 'ansi-term     'emacs)
(evil-set-initial-state 'dired-mode    'emacs)
;; workaround for fix evil-leader enable on ibuffer-mode and package-menu-mode
(evil-set-initial-state 'ibuffer-mode    'normal)
(evil-set-initial-state 'package-menu-mode    'normal)
(evil-set-initial-state 'help-mode    'normal)

(provide 'setup-evil-integration)
