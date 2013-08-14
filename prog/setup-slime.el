(eval-after-load 'slime
  '(progn
     (require 'slime)
     (setq inferior-lisp-program "/usr/bin/sbcl")
     (slime-setup)))

(provide 'setup-slime)
