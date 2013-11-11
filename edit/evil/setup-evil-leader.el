(require 'evil-leader)

(global-evil-leader-mode)

(evil-leader/set-leader ",")
(evil-leader/set-key
  ","  'smex
  "#"  'wg/ido-erc-buffer
  "%"  'wg/ido-term-buffer
  "ww" 'wg/ido-for-all-mode
  "wd" 'wg/ido-dired-buffer
  "wi" 'wg/ido-for-this-mode
  "<"  'winner-undo
  ">"  'winner-redo
  "+"  'balance-windows
  "="  'indent-whole-buffer
  "0"  'delete-window
  "1"  'delete-other-windows
  "2"  'split-window-below
  "3"  'split-window-right
  "b"  'ido-switch-buffer
  "B"  'ibuffer
  "c"  'recompile
  "C"  'compile
  "d"  'ido-dired
  "e"  'er/expand-region
  "E"  'er/contract-region
  "f"  'ido-find-file
  "F"  'recentf-ido-find-file
  "g"  'magit-status
  "hg" 'helm-do-grep
  "hf" 'helm-find-files
  "hm" 'helm-M-x
  "hs" 'helm-swoop
  "i"  'indent-on-page
  "G"  'magit-log
  "k"  'kill-buffer
  "K"  'kill-buffer-and-window
  "nr" 'narrow-to-region
  "nf" 'narrow-to-defun
  "np" 'narrow-to-page
  "ni" 'iedit-mode
  "nd" 'iedit-dwim
  "nq" 'widen
  "pp" 'projectile-find-file
  "ph" 'helm-projectile
  "pg" 'projectile-ack
  "pb" 'projectile-switch-to-buffer
  "po" 'projectile-switch-project
  "pm" 'projectile-multi-occur
  "pr" 'projectile-replace
  "r"  'vr/replace
  "R"  'vr/query-replace
  "s"  'save-buffer
  "S"  'save-some-buffers)

(defmacro evil-leader/set-key-for-modes (mode key def &rest bindings)
  `(dolist (my-mode ,mode)
     (evil-leader/set-key-for-mode my-mode ,key ,def ,@bindings)))

(evil-leader/set-key-for-modes
 '(c-mode c++-mode)
 "t" 'gtags-find-tag
 "T" 'gtags-find-symbol)

(evil-leader/set-key-for-modes
 '(ruby-mode web-mode)
 "hra" 'helm-rails-all
 "hrm" 'helm-rails-models
 "hrv" 'helm-rails-views
 "hrc" 'helm-rails-controllers
 "hrj" 'helm-rails-javascripts
 "hrs" 'helm-rails-stylesheets
 "hrl" 'helm-rails-helpers
 "hro" 'rinari-find-configuration
 "hrl" 'rinari-find-lib
 "hry" 'yari-helm)

(evil-leader/set-key-for-mode 'ruby-mode
  "mm" 'ruby-send-block
  "ml" 'ruby-send-current-line
  "mr" 'ruby-send-region
  "mb" 'ruby-send-buffer
  "mi" 'inf-ruby
  "md" 'robe-doc)

(evil-leader/set-key-for-mode 'haskell-mode
  "mm" 'inferior-haskell-load-file)

(provide 'setup-evil-leader)
