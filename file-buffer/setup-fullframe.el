;; require package (fullframe)
(require 'fullframe)

(eval-after-load 'package
  '(fullframe list-packages quit-window))

(eval-after-load 'magit
  '(fullframe magit-status magit-mode-quit-window))

(provide 'setup-fullframe)
