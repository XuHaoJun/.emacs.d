(add-to-list 'load-path (concat base-setup-dir "/prog/lng"))
(require 'setup-lng-init)

;; (add-to-list 'load-path (concat user-emacs-directory "prog/android"))
;; (require 'setup-android-init)

;; (require 'setup-yasnippet)

(require 'setup-prog-utils)
(require 'setup-company)
(require 'setup-compile)
(require 'setup-eldoc)
(require 'setup-c-eldoc)
(require 'setup-git)
(require 'setup-auto-indentation)
(require 'setup-projectile)
(require 'setup-inf-mongo)
(require 'setup-sr-speedbar)

(provide 'init-prog-plugin)
