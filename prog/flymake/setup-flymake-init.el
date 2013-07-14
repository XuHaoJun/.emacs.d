(require 'flymake)

(require 'setup-flymake-basic)

;; (eval-after-load 'flymake '(require 'setup-flymake-clang))
(add-hook 'c++-mode-hook 'flymake-mode)

(require 'setup-flymake-tex)

(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

(require 'flymake-shell)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)

(require 'helm-flymake)

(provide 'setup-flymake-init)
