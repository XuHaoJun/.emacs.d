(setq inf-mongo-command
      (executable-find "mongo"))

(require 'ac-inf-mongo)
(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'inf-mongo-mode))
(add-hook 'inf-mongo-mode-hook 'ac-inf-mongo-enable)

(provide 'setup-inf-mongo)
