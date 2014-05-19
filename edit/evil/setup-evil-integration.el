(eval-after-load 'package
  '(progn
     (defvar package-menu-mode-map)
     (evil-make-overriding-map package-menu-mode-map 'normal)))

(eval-after-load 'help-mode
  '(progn
     (defvar help-mode-map)
     ;; force unbound space key for evil-ace-jump
     ;; origin key is scroll-page, i use C-f(evil-mode) replace it
     (define-key help-mode-map (kbd "SPC") nil)
     (evil-make-overriding-map help-mode-map 'normal)
     (evil-add-hjkl-bindings help-mode-map 'normal
       "h" 'evil-backward-char)))

(evil-set-initial-state 'term-mode     'emacs)
(evil-set-initial-state 'ansi-term     'emacs)
(evil-set-initial-state 'dired-mode    'emacs)
;; workaround for fix evil-leader enable
(evil-set-initial-state 'ibuffer-mode    'normal)
(evil-set-initial-state 'package-menu-mode    'normal)
(evil-set-initial-state 'help-mode    'normal)

(provide 'setup-evil-integration)
