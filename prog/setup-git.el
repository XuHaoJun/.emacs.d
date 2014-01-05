(require 'magit)
(require 'git-gutter-fringe)
(require 'git-blame)
(require 'git-commit-mode)
(require 'gitignore-mode)
(require 'gitconfig-mode)
(require 'yagist)
(require 'github-browse-file)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
    "Restores the previous window configuration and kills the magit buffer"
      (interactive)
        (kill-buffer)
          (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(eval-after-load 'git-gutter
  '(require 'git-gutter-fringe))

(provide 'setup-git)
