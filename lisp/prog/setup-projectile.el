(require 'projectile)
(projectile-global-mode) ;; to enable in all buffers
(diminish 'projectile-mode)
(setq projectile-enable-caching nil)
(setq projectile-use-git-grep t)

(setq projectile-fallback-priority '(git-grep ag ack grep))
(setq projectile-fallback-grep-tools
      '((git-grep . (lambda (&optional arg)
                      (when (and projectile-use-git-grep
                                 (executable-find "git")
                                 (eq (projectile-project-vcs) 'git))
                        (projectile-grep arg)
                        t)))

        (ag . (lambda ()
                (when (and (executable-find "ag")
                           (fboundp 'ag-regexp))
                  (projectile-ag (read-from-minibuffer
                                  (projectile-prepend-project-name "Ag search for: ")
                                  (projectile-symbol-at-point)))
                  t)))

        (ack . (lambda ()
                 (when (and (executable-find "ack")
                            (require 'ack-and-a-half nil 'noerror))
                   (projectile-ack (read-from-minibuffer
                                    (projectile-prepend-project-name "Ack search for: ")
                                    (projectile-symbol-at-point)))
                   t)))
        (grep .
              (lambda (&optional arg)
                (when (executable-find "grep")
                  (projectile-grep arg)
                  t)))))

(defun projectile-enh-grep (&optional arg)
  (interactive "P")
  (let ((fallbacks projectile-fallback-grep-tools)
        (fallbacks-priority projectile-fallback-priority)
        (did-greped nil))
    (while (and (not did-greped)
                fallbacks-priority)
      (setq did-greped
            (funcall
             (cdr (assoc (pop fallbacks-priority)
                         fallbacks)))))))

(provide 'setup-projectile)
