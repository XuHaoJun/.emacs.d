(require 'package)

(defvar pkg-lst
  '(ace-jump-mode ack-and-a-half ag auctex
             autopair android-mode anzu
             ace-window anaconda-mode
             c-eldoc company company-go company-ghc company-auctex
             company-inf-ruby company-tern
             color-moccur css-eldoc coffee-mode command-log-mode
             clang-format clojure-mode cider company-anaconda
             dired-subtree dired-details dired-details+ dired-single dynamic-fonts diminish
             eldoc-extension emacs-eclim erc-hl-nicks expand-region emmet-mode
             evil evil-leader evil-numbers evil-matchit evil-jumper evil-visualstar
             eshell-prompt-extras
             flex-isearch fuzzy flycheck flycheck-clangcheck flx flx-ido fullframe fic-mode
             geiser google-this
             gitconfig-mode github-browse-file gitignore-mode google-c-style
             go-mode go-eldoc go-snippets ggtags
             helm helm-ack helm-ag helm-c-moccur helm-gtags helm-rails
             helm-projectile helm-css-scss helm-open-github helm-swoop
             htmlize haskell-mode highlight-symbol
             ibuffer-vc ido-sort-mtime ido-ubiquitous
             ido-vertical-mode iedit inf-ruby inf-mongo ipretty
             js2-mode json-mode
             lua-mode less-css-mode
             magit multi-term markdown-mode web-mode
             nlinum
             openwith org org-octopress ox-reveal
             pkgbuild-mode pos-tip popwin projectile pangu-spacing prodigy
             quickrun
             rainbow-delimiters rainbow-mode ruby-electric ruby-block robe rinari racket-mode
             rust-mode
             window-numbering
             session shell-pop slime smex smartparens switch-window
             solarized-theme surround scss-mode sr-speedbar
             stylus-mode
             tronesque-theme
             undo-tree
             visual-regexp
             w3m wgrep wgrep-ack wgrep-helm
             yasnippet yari yaml-mode))


;; install the missing packages
(defun auto-install-packages ()
  (dolist (package pkg-lst)
    (when (not (package-installed-p package))
      (package-install package))))

(provide 'auto-install-packages)
