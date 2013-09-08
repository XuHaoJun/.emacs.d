(require 'flymake)

(require 'setup-flymake-basic)

;; (eval-after-load 'flymake '(require 'setup-flymake-clang))
(add-hook 'c++-mode-hook 'flymake-mode)

(require 'setup-flymake-tex)

(require 'helm-flymake)

(provide 'setup-flymake-init)
