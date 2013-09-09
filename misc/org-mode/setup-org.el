(setq org-startup-indented t)
(setq org-startup-folded t)
(setq org-hide-leading-stars t)
(add-hook 'org-mode-hook
          (lambda ()
            (setq truncate-lines nil)))
(add-hook 'org-mode-hook 'auto-fill-mode)

;; If you can't use it, try re-install org(8.x) and org-octopress.
(require 'org-octopress)
(setq org-octopress-directory-top       "~/current/octopress/source")
(setq org-octopress-directory-posts     "~/current/octopress/source/_posts")
(setq org-octopress-directory-org-top   "~/current/octopress/source")
(setq org-octopress-directory-org-posts "~/current/octopress/source/blog")
(setq org-octopress-setup-file          "~/.emacs.d/misc/org-mode/setupfile-sample.org")

;; A chinese word problem.
;; http://stackoverflow.com/questions/8550112/prevent-browser-converting-n-between-lines-into-space-for-chinese-characters/8551033#8551033
(defun han/org-html-delete-extra-space (string backend info)
  "Let chinese word to a line if match /han\newline/"
  (when (and (org-export-derived-backend-p backend 'html)
             (string-match "\\cc\n" string))
    (replace-regexp-in-string "\\(\\cc\\)\n\\(\\cc\\)" "\\1\\2" string)))
(eval-after-load 'ox-html
  '(add-to-list 'org-export-filter-final-output-functions
                'han/org-html-delete-extra-space))

(add-hook 'org-mode-hook
          (lambda ()
            (require 'pangu-spacing)
            (pangu-spacing-mode)
            (set (make-local-variable 'pangu-spacing-real-insert-separtor) t)))

;;From http://wenshanren.org/?p=334
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(provide 'setup-org)
