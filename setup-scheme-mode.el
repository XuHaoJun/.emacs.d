(require 'scheme)

(require 'geiser)
;;some key binding confilct,some i choice geise to main.
(eval-after-load 'geiser '(require 'quack))

(setq scheme-program-name "racket")  

(provide 'setup-scheme-mode)
