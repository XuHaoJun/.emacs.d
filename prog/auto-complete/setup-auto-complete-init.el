(require 'auto-complete)

(require 'setup-auto-complete-basic)

;; (require 'setup-auto-complete-clang)
(require 'setup-auto-complete-clang-async)

(eval-after-load 'ielm '(require 'setup-auto-complete-ielm))

;; (eval-after-load 'scheme-mode '(require 'setup-auto-complete-scheme))


(provide 'setup-auto-complete-init)
