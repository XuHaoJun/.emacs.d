(require 'package)

(defvar pkg-lst
  '(ac-slime ace-jump-mode ace-jump-buffer ack-and-a-half ag auctex auto-complete autopair android-mode
             browse-kill-ring
             c-eldoc company color-moccur
             dired+ dired-details dired-details+ dired-single dynamic-fonts
             ecb eldoc-extension emacs-eclim erc-hl-nicks evil evil-leader expand-region
             flex-isearch flymake flymake-cursor flymake-python-pyflakes flymake-shell fuzzy
             geiser git-blame git-commit-mode git-gutter-fringe
             gitconfig-mode github-browse-file gitignore-mode google-c-style
             helm helm-ack helm-ag helm-c-moccur helm-gtags
             ibuffer-vc ido-hacks ido-sort-mtime ido-ubiquitous ido-yes-or-no
             jedi
             magit multi-term
             nlinum
             openwith
             pkgbuild-mode pos-tip popwin
             quack
             rainbow-delimiters
             savekill scheme-complete session shell-pop slime smex smartparens
             solarized-theme surround switch-window
             undo-tree
             visual-regexp
             w3m wgrep wgrep-ack wgrep-helm
             yasnippet yagist))


;; install the missing packages
(dolist (package pkg-lst)
  (when (not (package-installed-p package))
    (package-install package)))

(provide 'auto-install-packages)
