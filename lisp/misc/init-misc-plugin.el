(add-to-list 'load-path (concat base-setup-dir "/misc/term"))
(require 'setup-term-init)

(add-to-list 'load-path (concat base-setup-dir "/misc/org-mode"))
(require 'setup-org-init)

(require 'setup-shell-pop)
(require 'setup-erc)
(require 'setup-stardict)
(require 'setup-w3m)
(require 'setup-newsticker)
(require 'setup-google-this)
(require 'setup-prodigy)
(require 'setup-eshell)

(provide 'init-misc-plugin)
