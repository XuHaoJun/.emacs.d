(require 'projectile)
(projectile-global-mode) ;; to enable in all buffers
(diminish 'projectile-mode)
(setq projectile-enable-caching t)

(setq projectile-cache-file (expand-file-name "~/.emacs.d/.var/cache/projectile.cache"))
(setq projectile-known-projects-file (expand-file-name "~/.emacs.d/.var/cache/projectile-bookmarks.eld"))

(provide 'setup-projectile)
