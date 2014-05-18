(add-to-list 'load-path (concat user-emacs-directory "misc/term"))
(require 'setup-term-init)

(add-to-list 'load-path (concat user-emacs-directory "misc/org-mode"))
(require 'setup-org-init)

(require 'setup-shell-pop)
(require 'setup-erc)
(require 'setup-stardict)
(require 'setup-w3m)
(require 'setup-newsticker)
(require 'setup-google-this)
(require 'setup-prodigy)

(provide 'init-misc-plugin)
