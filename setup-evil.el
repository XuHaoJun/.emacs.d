(require 'undo-tree)
(require 'evil)
(require 'setup-evil-basic)
(evil-mode t)

(require 'setup-evil-acejump)
(require 'setup-evil-leader)

;; (require 'mark-multiple)
;; ;;Easy access to the mark multiple library when in visual-mode
;; (define-key evil-visual-state-map (kbd "M-j") 'mark-next-like-this)
;; (define-key evil-visual-state-map (kbd "M-k") 'mark-previous-like-this)

;; emulates surround.vim
(require 'surround)
(global-surround-mode 1)

;; (require 'ecb)
;; (define-key evil-normal-state-map (kbd "C-w C-e") 'ecb-toggle-ecb-windows) ;;toggle ecb

(provide 'setup-evil)
