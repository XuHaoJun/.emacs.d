(require 'browse-kill-ring)
(setq browse-kill-ring-quit-action 'save-and-restore)

(global-set-key "\C-ck" 'browse-kill-ring)
(browse-kill-ring-default-keybindings)
(global-set-key "\C-cy" '(lambda ()
   (interactive)
   (popup-menu 'yank-menu)))

(provide 'setup-browse-kill-ring)
