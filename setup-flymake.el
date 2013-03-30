(require 'flymake)
(eval-after-load 'flymake '(require 'setup-flymake-clang))

;;it displays any flymake error for the current line on the minibuffer.
(eval-after-load 'flymake '(require 'flymake-cursor))
;;The built-in package help-at-pt provides similar functionality, and also doesn’t clobber the minibuffer text. 
  (custom-set-variables
     '(help-at-pt-timer-delay 0.9)
     '(help-at-pt-display-when-idle '(flymake-overlay)))

;; Only run flymake if I've not been typing for 5 seconds
(setq flymake-no-changes-timeout 5)

(provide 'setup-flymake)
