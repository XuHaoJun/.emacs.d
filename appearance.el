(blink-cursor-mode (- (*) (*) (*))) ;;blink disable

;; Theme
(require 'solarized-dark-theme)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; Font
(require 'dynamic-fonts)
(dynamic-fonts-setup)

;;Highlight current line
(global-hl-line-mode 1)

(provide 'appearance)
