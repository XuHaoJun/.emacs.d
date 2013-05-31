(when (executable-find "ag") (require 'ag))
(setq ag-highlight-search t)
(add-hook 'ag-mode-hook 'wgrep-ack-and-a-half-setup)

(provide 'setup-ag)
