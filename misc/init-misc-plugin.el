(add-to-list 'load-path (concat user-emacs-directory "misc/term"))
(require 'setup-term-init)

(require 'setup-shell-pop)
(require 'setup-erc)
(require 'setup-stardict)
(require 'setup-w3m)
(require 'setup-newsticker)
(require 'setup-org)

(provide 'init-misc-plugin)
