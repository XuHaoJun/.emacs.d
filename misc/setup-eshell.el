(require 'eshell)
(setq eshell-save-history-on-exit t
      eshell-history-size 1024
      eshell-hist-ignoredups t
      eshell-cmpl-ignore-case t
      eshell-cp-interactive-query t
      eshell-ln-interactive-query t
      eshell-mv-interactive-query t
      eshell-rm-interactive-query t
      eshell-mv-overwrite-files nil
      eshell-highlight-prompt   t
      eshell-prompt-regexp      "^[^#$\n]* [#>]+ "
      eshell-prompt-function    (lambda nil
                                  (concat
                                   (abbreviate-file-name
                                    (eshell/pwd))
                                   (if
                                       (=
                                        (user-uid)
                                        0)
                                       " # " " >>> "))))

(eval-after-load 'helm
  '(add-hook 'eshell-mode-hook
             #'(lambda ()
                 (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete))))

(provide 'setup-eshell)
