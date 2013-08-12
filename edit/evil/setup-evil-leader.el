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
  "i"  'indent-on-window
  "G"  'magit-log
  "j"  'ace-jump-buffer
  "k"  'kill-buffer
  "K"  'kill-buffer-and-window
  "r"  'vr/replace
  "R"  'vr/query-replace
  "s"  'save-buffer
  "S"  'save-some-buffers)

(dolist (my-mode '(c-mode c++-mode))
  (evil-leader/set-key-for-mode my-mode
    "t" 'gtags-find-tag
    "T" 'gtags-find-symbol))

(dolist (my-mode '(ruby-mode web-mode))
  (evil-leader/set-key-for-mode my-mode
    "hp" 'helm-rails-all
    "hy" 'yari-helm))

(provide 'setup-evil-leader)
