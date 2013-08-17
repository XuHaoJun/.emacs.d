(setq org-startup-indented t)
(setq org-startup-folded t)
(setq org-hide-leading-stars t)
(add-hook 'org-mode-hook 'auto-fill-mode)

(require 'org-octopress)
(setq org-octopress-directory-top       "~/current/octopress/source")
(setq org-octopress-directory-posts     "~/current/octopress/source/_posts")
(setq org-octopress-directory-org-top   "~/current/octopress/source")
(setq org-octopress-directory-org-posts "~/current/octopress/source/blog")
(setq org-octopress-setup-file          "~/.emacs.d/misc/org-mode/setupfile-sample.org")

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
