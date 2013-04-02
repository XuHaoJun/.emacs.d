(require 'shell-pop)

(shell-pop-set-universal-key (kbd "<f9>"))
(shell-pop-set-internal-mode "ansi-term")
(shell-pop-set-internal-mode-shell "/bin/zsh")
(shell-pop-set-window-height 45)
(shell-pop-set-window-position "bottom")

(provide 'setup-shell-pop)
