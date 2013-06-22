(add-to-list 'load-path (concat user-emacs-directory "prog/lng"))
(require 'setup-lng-init)

(add-to-list 'load-path (concat user-emacs-directory "prog/android"))
(require 'setup-android-init)

(add-to-list 'load-path (concat user-emacs-directory "prog/auto-complete"))
(require 'setup-auto-complete-init)

(add-to-list 'load-path (concat user-emacs-directory "prog/flymake"))
(require 'setup-flymake-init)

(require 'setup-compile)
(require 'setup-slime)
(require 'setup-eldoc)
(require 'setup-c-eldoc)
(require 'setup-yasnippet)
(require 'setup-gtags)
(require 'setup-git)
(require 'setup-auto-indentation)
;; (require 'setup-ecb)

(provide 'init-prog-plugin)
