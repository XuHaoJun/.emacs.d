(require 'flymake)

;;it displays any flymake error for the current line on the minibuffer.
(eval-after-load 'flymake '(require 'flymake-cursor))
;;The built-in package help-at-pt provides similar functionality, and also doesn’t clobber the minibuffer text. 
  (custom-set-variables
     '(help-at-pt-timer-delay 0.9)
     '(help-at-pt-display-when-idle '(flymake-overlay)))

;; Only run flymake if I've not been typing for 60 seconds
;; more let check after save(C-x C-s).
(setq flymake-no-changes-timeout 3600)

;;;https://github.com/illusori/emacs-flymake
;; Nope, I want my copies in the system temp dir.
(setq flymake-run-in-place nil)
;; This lets me say where my temp dir is.
(setq temporary-file-directory "~/.emacs.d/tmp/")
;; I want to see all errors for the line.
(setq flymake-number-of-errors-to-display nil)

(provide 'setup-flymake-basic)
