(require 'evil)
(require 'setup-evil-basic)
(require 'setup-evil-leader)
(require 'setup-evil-acejump)
(evil-mode t)

;; emulates surround.vim
(require 'surround)
(global-surround-mode 1)

;; (require 'ecb)
;; (define-key evil-normal-state-map (kbd "C-w C-e") 'ecb-toggle-ecb-windows) ;;toggle ecb

;; (require 'mark-multiple)
;; ;;Easy access to the mark multiple library when in visual-mode
;; (define-key evil-visual-state-map (kbd "M-j") 'mark-next-like-this)
;; (define-key evil-visual-state-map (kbd "M-k") 'mark-previous-like-this)

(provide 'setup-evil-init)
