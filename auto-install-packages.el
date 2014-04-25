(require 'package)

(defvar pkg-lst
  '(ac-slime ace-jump-mode ack-and-a-half ag auctex auto-complete
             autopair android-mode anzu ac-inf-ruby ac-js2 ac-emmet ac-math
             browse-kill-ring
             c-eldoc company color-moccur css-eldoc coffee-mode command-log-mode
             clojure-mode cider ac-nrepl
             dired+ dired-details dired-details+ dired-single dynamic-fonts diminish
             eldoc-extension emacs-eclim erc-hl-nicks expand-region emmet-mode
             evil evil-leader evil-numbers evil-matchit
             flex-isearch flymake flymake-cursor fuzzy flycheck flx flx-ido fullframe
             geiser git-blame git-commit-mode google-this
             gitconfig-mode github-browse-file gitignore-mode google-c-style
             go-mode go-eldoc go-autocomplete go-snippets
             helm helm-ack helm-ag helm-c-moccur helm-gtags helm-flymake helm-rails
             helm-projectile helm-css-scss helm-flycheck helm-open-github helm-swoop
             htmlize haskell-mode highlight-symbol
             ibuffer-vc ido-sort-mtime ido-ubiquitous ido-yes-or-no
             ido-vertical-mode iedit inf-ruby inf-mongo ipretty
             jedi js2-mode
             magit multi-term
             nlinum
             openwith org org-octopress
             pkgbuild-mode pos-tip popwin projectile pangu-spacing
             rainbow-delimiters rainbow-mode ruby-electric ruby-block robe rinari
             window-numbering
             savekill session shell-pop slime smex smartparens smart-operator
             solarized-theme surround scss-mode
             tronesque-theme
             undo-tree
             visual-regexp
             w3m wgrep wgrep-ack wgrep-helm web-mode
             yasnippet yari yaml-mode))


;; install the missing packages
(defun auto-install-pacs ()
  (dolist (package pkg-lst)
    (when (not (package-installed-p package))
      (package-install package))))

(provide 'auto-install-packages)
