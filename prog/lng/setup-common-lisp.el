;; rquire package '(slime-company)
(eval-after-load 'lisp '(progn
                          (require 'slime-company)
                          (require 'slime)
                          (slime-setup '(slime-company))))

;; See http://bc.tech.coop/blog/070927.html
(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(add-hook 'lisp-mode-hook (lambda ()
                            (unless (featurep 'slime)
                              (require 'slime)
                              (normal-mode))))

(defun setup-slime-lisp-implementations ()
  (when (executable-find "sbcl")
    (add-to-list 'slime-lisp-implementations
                 '(sbcl ("sbcl") :coding-system utf-8-unix)))
  (when (executable-find "lisp")
    (add-to-list 'slime-lisp-implementations
                 '(cmucl ("lisp") :coding-system iso-latin-1-unix))))

(eval-after-load 'slime '(setup-slime-lisp-implementations))

;; From http://bc.tech.coop/blog/070515.html
(defun common-lisp-online-doc ()
  "Searches lispdoc.com for SYMBOL, which is by default the symbol currently under the curser"
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
                (if (or word-at-point symbol-at-point)
                  (concat "Symbol (default " default "): ")
                  "Symbol (no default): "))))
    (if (and (string= inp "") (not word-at-point) (not
                                                    symbol-at-point))
      (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                           "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                            (if (string= inp "")
                              default
                              inp)
                            "&search="
                            (if (string-equal search-type "f")
                              "full+text+search"
                              "basic+search")))))))

(provide 'setup-common-lisp)
