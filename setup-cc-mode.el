
(require 'cc-mode)

(add-hook 'c-mode-common-hook 'google-set-c-style)
;; (setq c-default-style
;;       '((java-mode . "java")
;;         (awk-mode . "awk")
;;         (c++-mode . "ellemtel")
;;         (other . "k&r")))

;;for work with auto-indent mode
(add-hook 'c-mode-common-hook
          (lambda () (setq indent-tabs-mode t)))

(require 'gtags)
(setq c-mode-hook
      '(lambda ()
         (gtags-mode 1)));get into gtags-mode whenever you get into c-mode
(setq c++-mode-hook
      '(lambda ()
         (gtags-mode 1)));get into gtags-mode whenever you get into c-mode


(provide 'setup-cc-mode)
