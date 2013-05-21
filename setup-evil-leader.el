(require 'evil-leader)

(global-evil-leader-mode)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "," 'smex
  "#" 'rgr/ido-erc-buffer
  "%" 'ido-term-buffer
  "<" 'winner-undo
  ">" 'winner-redo
  "=" 'indent-whole-buffer
  "0" 'delete-window
  "1" 'delete-other-windows
  "2" 'split-window-below
  "3" 'split-window-right
  "b" 'ido-switch-buffer
  "B" 'ibuffer
  "c" 'recompile
  "C" 'compile
  "d" 'ido-dired
  "e" 'er/expand-region
  "E" 'er/contract-region
  "f" 'ido-find-file
  "F" 'recentf-ido-find-file
  "g" 'magit-status
  "G" 'magit-log
  "i" 'flex-isearch-forward
  "I" 'flex-isearch-backward
  "k" 'kill-buffer
  "K" 'kill-buffer-and-window
  "r" 'vr/replace
  "R" 'vr/query-replace
  "s" 'save-buffer
  "S" 'save-some-buffers)

(dolist (my-mode '(c-mode c++-mode))
  (evil-leader/set-key-for-mode my-mode
    "t" 'gtags-find-tag
    "T" 'gtags-find-symbol))

(provide 'setup-evil-leader)
