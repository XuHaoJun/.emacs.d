(require 'auto-complete-clang-async)

(defun ac-clang-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/site-lisp/emacs-clang-complete-async/clang-complete")
  (make-local-variable 'ac-sources)
  (setq ac-sources (append ac-sources '(ac-source-clang-async)))
  (ac-clang-launch-completion-process))

(eval-after-load 'auto-complete
  '(add-hook 'c-mode-common-hook 'ac-clang-cc-mode-setup))

(provide 'setup-auto-complete-clang-async)
