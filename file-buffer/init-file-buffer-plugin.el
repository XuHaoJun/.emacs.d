(add-to-list 'load-path (concat user-emacs-directory "file-buffer/ido"))
(require 'setup-ido-init)

(require 'setup-ibuffer)
(require 'setup-recentf)
(require 'setup-dired)
(require 'setup-helm)
(require 'setup-openwith)
(require 'setup-popwin)

(require 'switch-window)

(provide 'init-file-buffer-plugin)
