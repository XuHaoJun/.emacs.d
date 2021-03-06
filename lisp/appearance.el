;; Theme
(if window-system
    (load-theme 'solarized-dark t)
  (load-theme 'tronesque t))

;;blink disable
(blink-cursor-mode (- (*) (*) (*)))
;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;Highlight current line
(global-hl-line-mode 1)

;; Font
(require 'dynamic-fonts)
(setq-default dynamic-fonts-preferred-monospace-point-size 16)
(setq-default dynamic-fonts-preferred-proportional-point-size 16)
(setq-default dynamic-fonts-preferred-monospace-fonts (cons "Anonymous Pro" (delq  "Anonymous Pro" dynamic-fonts-preferred-monospace-fonts)))
(dynamic-fonts-setup)


;; (require 'window-numbering)
;; (custom-set-faces '(window-numbering-face ((t (:weight bold)))))
;; (window-numbering-mode 1)
;; require ace-window
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

(require 'rainbow-delimiters)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

(provide 'appearance)
