(require 'evil-leader)

(global-evil-leader-mode)

(evil-leader/set-leader ",")
(evil-leader/set-key
  ","  'smex
  "#"  'wg/ido-erc-buffer
  "%"  'wg/ido-term-buffer
  "ww" 'wg/ido-for-all-mode
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
  "hm" 'helm-c-moccur-occur-by-moccur
  "i"  'indent-on-page
  "G"  'magit-log
  "j"  'ace-jump-buffer
  "k"  'kill-buffer
  "K"  'kill-buffer-and-window
  "nr" 'narrow-to-region
  "nf" 'narrow-to-defun
  "np" 'narrow-to-page
  "ni" 'iedit-mode
  "nd" 'iedit-dwim
  "nq" 'widen
  "pp" 'helm-projectile
  "pg" 'projectile-ack
  "pb" 'projectile-switch-buffer
  "pr" 'projectile-switch-project
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
 "hp" 'helm-rails-all
 "hy" 'yari-helm)

(provide 'setup-evil-leader)
