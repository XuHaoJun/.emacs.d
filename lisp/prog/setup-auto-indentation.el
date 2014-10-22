;; from http://www.emacswiki.org/emacs/AutoIndentation

(dolist (command '(yank yank-pop evil-paste-after evil-paste-before evil-paste-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode lisp-interaction-mode
                                                     web-mode html-mode go-mode
                                                     coffee-mode js2-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(provide 'setup-auto-indentation)
