(require 'smart-operator)
(defun my-common-smart-operator-hook()
  (smart-insert-operator-hook)
  (local-unset-key (kbd "."))
  (local-unset-key (kbd ":")))

(add-hook 'ruby-mode-hook 'my-common-smart-operator-hook)
(add-hook 'js2-mode-hook 'my-common-smart-operator-hook)
(add-hook 'coffee-mode-hook 'my-common-smart-operator-hook)
(add-hook 'python-mode-hook 'my-common-smart-operator-hook)

(defun my-c-mode-common-hook()
  (smart-insert-operator-hook)
  (local-unset-key (kbd "."))
  (local-unset-key (kbd ":"))
  (local-set-key (kbd "*") 'c-electric-star))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(provide 'setup-smart-operator)
