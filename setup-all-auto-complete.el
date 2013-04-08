(require 'auto-complete)

(eval-after-load 'auto-complete '(require 'setup-auto-complete))
(eval-after-load 'auto-complete '(require 'setup-auto-complete-clang))
(eval-after-load 'ielm '(require 'setup-auto-complete-ielm))
(eval-after-load 'scheme-mode '(require 'setup-auto-complete-scheme))

(provide 'setup-all-auto-complete)
