(require 'flymake)

(require 'setup-flymake)
(eval-after-load 'flymake '(require 'setup-flymake-clang))
(eval-after-load 'flymake '(require 'setup-flymake-tex))

(provide 'setup-all-flymake)
