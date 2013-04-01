(require 'flymake)
(eval-after-load 'flymake '(require 'setup-flymake-clang))

;;it displays any flymake error for the current line on the minibuffer.
(eval-after-load 'flymake '(require 'flymake-cursor))
;;The built-in package help-at-pt provides similar functionality, and also doesn’t clobber the minibuffer text. 
  (custom-set-variables
     '(help-at-pt-timer-delay 0.9)
     '(help-at-pt-display-when-idle '(flymake-overlay)))

;; Only run flymake if I've not been typing for 60 seconds
;; more let check after save(C-x C-s).
(setq flymake-no-changes-timeout 60)

(provide 'setup-flymake)
