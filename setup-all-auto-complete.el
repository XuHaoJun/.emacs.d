(require 'auto-complete)

(require 'setup-auto-complete)

;; (require 'setup-auto-complete-clang)
(require 'setup-auto-complete-clang-async)

(eval-after-load 'ielm '(require 'setup-auto-complete-ielm))

(eval-after-load 'scheme-mode '(require 'setup-auto-complete-scheme))


(provide 'setup-all-auto-complete)

