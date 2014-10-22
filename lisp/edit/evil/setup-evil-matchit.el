(defun evilmi-customize-keybinding ()
  (evil-define-key 'normal evil-matchit-mode-map
    "%" 'evilmi-jump-items))

(global-evil-matchit-mode 1)

(provide 'setup-evil-matchit)
