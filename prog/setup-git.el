;; require package: (fullframe)

(require 'magit)
(require 'git-blame)
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
(setq-default
 magit-save-some-buffers nil
 magit-process-popup-time 10
 magit-diff-refine-hunk t
 magit-completing-read-function 'magit-ido-completing-read)

(after-load 'magit
            (fullframe magit-status magit-mode-quit-window))

;;; When we start working on git-backed files, use git-wip if available
(after-load 'magit
            (global-magit-wip-save-mode)
            (diminish 'magit-wip-save-mode))

(after-load 'magit
              (diminish 'magit-auto-revert-mode))

(provide 'setup-git)
