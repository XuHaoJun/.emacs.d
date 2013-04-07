(require 'auto-complete)

(eval-after-load 'auto-complete '(require 'setup-auto-complete))
(eval-after-load 'auto-complete '(require 'setup-auto-complete-clang))
(eval-after-load 'ielm '(require 'setup-auto-complete-ielm))

(provide 'setup-all-auto-complete)
