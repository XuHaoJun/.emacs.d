;; require package: (magit gitignore-mode gitconfig-mode github-browse-file)

(require 'magit)
(require 'git-commit-mode)
(require 'gitignore-mode)
(require 'gitconfig-mode)
(require 'github-browse-file)

(eval-after-load 'magit
  '(diminish 'magit-auto-revert-mode))

(provide 'setup-git)
