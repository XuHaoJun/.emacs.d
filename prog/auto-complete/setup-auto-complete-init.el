(require 'setup-auto-complete-basic)

;; (when (executable-find "clang")
;;   (require 'setup-auto-complete-clang-async))

;; (require 'setup-auto-complete-clang)

(eval-after-load 'ielm '(require 'setup-auto-complete-ielm))

;; (eval-after-load 'scheme-mode '(require 'setup-auto-complete-scheme))


(provide 'setup-auto-complete-init)
