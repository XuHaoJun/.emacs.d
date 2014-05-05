(add-to-list 'load-path (concat user-emacs-directory "prog/lng"))
(require 'setup-lng-init)

;; (add-to-list 'load-path (concat user-emacs-directory "prog/android"))
;; (require 'setup-android-init)

;; (add-to-list 'load-path (concat user-emacs-directory "prog/auto-complete"))
;; (require 'setup-auto-complete-init)

;; (add-to-list 'load-path (concat user-emacs-directory "prog/flymake"))
;; (require 'setup-flymake-init)

;; (add-to-list 'load-path (concat user-emacs-directory "prog/yasnippet"))
;; (require 'setup-yasnippet)

(require 'setup-prog-utils)
(require 'setup-company)
(require 'setup-compile)
(require 'setup-slime)
(require 'setup-eldoc)
(require 'setup-c-eldoc)
(require 'setup-gtags)
(require 'setup-git)
(require 'setup-auto-indentation)
(require 'setup-projectile)
(require 'setup-inf-mongo)
;; (require 'setup-smart-operator)
;; (require 'setup-ecb)

(provide 'init-prog-plugin)
