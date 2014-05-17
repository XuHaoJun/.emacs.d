(require 'evil-leader)

(global-evil-leader-mode)

(evil-leader/set-leader ";")
(evil-leader/set-key
  ";"  'smex
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
  "hk" 'helm-show-kill-ring
  "i"  'indent-on-page
  "I"  'indent-on-buffer
  "G"  'magit-log
  "k"  'kill-buffer
  "K"  'kill-buffer-and-window
  "nr" 'narrow-to-region
  "nf" 'narrow-to-defun
  "np" 'narrow-to-page
  "ni" 'iedit-mode
  "nd" 'iedit-dwim
  "nw" 'widen
  "o"  'other-window
  "O"  'ace-window
  "pp" 'projectile-find-file
  "ph" 'helm-projectile
  "pg" 'projectile-ag
  "pb" 'projectile-switch-to-buffer
  "po" 'projectile-switch-project
  "pm" 'projectile-multi-occur
  "pr" 'projectile-replace
  "pi" 'projectile-invalidate-cache
  "r"  'vr/replace
  "R"  'vr/query-replace
  "s"  'save-buffer
  "S"  'save-some-buffers)

(defmacro evil-leader/set-key-for-modes (mode key def &rest bindings)
  `(dolist (my-mode ,mode)
     (evil-leader/set-key-for-mode my-mode ,key ,def ,@bindings)))

(when (executable-find "clang-format")
  (evil-leader/set-key-for-modes
   '(c-mode c++-mode)
   "i" 'clang-format-region
   "I" 'clang-format-region))

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
  "mm" 'ruby-send-region-or-mystuff
  "ml" 'ruby-send-current-line
  "mb" 'ruby-send-buffer
  "mr" 'inf-ruby
  "md" 'robe-doc)

(evil-leader/set-key-for-modes
 '(emacs-lisp-mode lisp-interaction-mode)
 "mm" 'eval-defun
 "mb" 'eval-buffer
 "me" 'eval-last-sexp
 "mp" 'eval-print-last-sexp)

(evil-leader/set-key-for-mode 'scheme-mode
  "mm" 'geiser-eval-definition
  "mb" 'geiser-eval-buffer
  "me" 'geiser-eval-last-sexp
  "mr" 'run-geiser
  "mq" 'geiser-unload)

(evil-leader/set-key-for-mode 'js2-mode
  "mm" 'skewer-eval-defun
  "mb" 'skewer-load-buffer
  "me" 'skewer-eval-last-expression
  "mr" 'run-skewer
  "mq" 'httpd-stop)

(evil-leader/set-key-for-mode 'python-mode
  "mm" 'python-shell-send-defun
  "mb" 'python-shell-send-buffer
  "mr" 'python-shell-switch-to-shell)

(evil-leader/set-key-for-mode 'lisp-mode
  "mm" 'slime-eval-defun
  "mb" 'slime-eval-buffer
  "me" 'slime-eval-last-expression
  "mr" 'slime
  "mq" 'slime-quit-lisp
  "md" 'common-lisp-online-doc)

(evil-leader/set-key-for-mode 'clojure-mode
  "mm" 'cider-eval-defun-at-point
  "mb" 'cider-eval-buffer
  "me" 'cider-eval-last-sexp
  "mr" 'cider-jack-in
  "mq" 'cider-quit)

(evil-leader/set-key-for-mode 'haskell-mode
  "mm" 'inferior-haskell-load-file)

(evil-leader/set-key-for-mode 'go-mode
  "mgi" 'go-goto-imports
  "mia" 'go-import-add)

(provide 'setup-evil-leader)
