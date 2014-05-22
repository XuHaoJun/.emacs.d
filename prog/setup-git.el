;; require package: (fullframe)

(require 'magit)
(require 'git-commit-mode)
(require 'gitignore-mode)
(require 'gitconfig-mode)
(require 'github-browse-file)

;; magit setting from purcell's .emacs
;; https://github.com/purcell/emacs.d

(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(after-load 'magit
  (diminish 'magit-auto-revert-mode))

(provide 'setup-git)
