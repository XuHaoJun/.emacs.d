(add-to-list 'load-path (concat user-emacs-directory "misc/term"))
(require 'setup-term-init)

(add-to-list 'load-path (concat user-emacs-directory "misc/org-mode"))
(require 'setup-org)

(require 'setup-shell-pop)
(require 'setup-erc)
(require 'setup-stardict)
(require 'setup-w3m)
(require 'setup-newsticker)
(require 'setup-google-this)

(require 'command-log-mode)

(provide 'init-misc-plugin)
