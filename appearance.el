;; (setq visible-bell nil
;;       font-lock-maximum-decoration t
;;       color-theme-is-global t
;;       truncate-partial-width-windows nil)

(blink-cursor-mode (- (*) (*) (*))) ;;blink disable

;; Theme
(require 'solarized-dark-theme)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; (require 'rainbow-delimiters)
;; (global-rainbow-delimiters-mode)

;; Let term color deal with solarized-dark theme
(when window-system
  (setq
   term-default-fg-color "#839496"
   term-default-bg-color "#002b36"))

;; Font
(require 'dynamic-fonts)
(dynamic-fonts-setup)

;; Tab show
;; (require 'tabbar)
;; (set-face-attribute
;;  'tabbar-default nil
;;  :background "gray20"
;;  :foreground "gray20"
;;  :box '(:line-width 1 :color "gray20" :style nil))
;; (set-face-attribute
;;  'tabbar-unselected nil
;;  :background "gray30"
;;  :foreground "white"
;;  :box '(:line-width 5 :color "gray30" :style nil))
;; (set-face-attribute
;;  'tabbar-selected nil
;;  :background "gray75"
;;  :foreground "black"
;;  :box '(:line-width 5 :color "gray75" :style nil))
;; (set-face-attribute
;;  'tabbar-highlight nil
;;  :background "white"
;;  :foreground "black"
;;  :underline nil
;;  :box '(:line-width 5 :color "white" :style nil))
;; (set-face-attribute
;;  'tabbar-button nil
;;  :box '(:line-width 1 :color "gray20" :style nil))
;; (set-face-attribute
;;  'tabbar-separator nil
;;  :background "gray20"
;;  :height 0.6)

;; ;; Change padding of the tabs
;; ;; we also need to set separator to avoid overlapping tabs by highlighted tabs
;; (custom-set-variables
;;  '(tabbar-separator (quote (0.5))))
;; ;; adding spaces
;; (defun tabbar-buffer-tab-label (tab)
;;   "Return a label for TAB.
;; That is, a string used to represent it on the tab bar."
;;   (let ((label  (if tabbar--buffer-show-groups
;;                     (format "[%s]  " (tabbar-tab-tabset tab))
;;                   (format "%s  " (tabbar-tab-value tab)))))
;;     ;; Unless the tab bar auto scrolls to keep the selected tab
;;     ;; visible, shorten the tab label to keep as many tabs as possible
;;     ;; in the visible area of the tab bar.
;;     (if tabbar-auto-scroll-flag
;;         label
;;       (tabbar-shorten
;;        label (max 1 (/ (window-width)
;;                        (length (tabbar-view
;;                                 (tabbar-current-tabset)))))))))

;; (tabbar-mode t)

;; (set-face-background 'region "#464740")

;;Highlight current line
(global-hl-line-mode 1)

;; Customize background color of lighlighted line
;; (set-face-background 'hl-line "#222222")

;; Highlight in yasnippet
;;(set-face-background 'yas/field-highlight-face "#333399")

;; Preeeetty font in Emacs 24/Ubuntu
;; (if is-mac nil
;;   (set-default-font "DejaVu Sans Mono")
;;   (set-face-attribute 'default nil :height 105))

;; org-mode colors
;; (setq org-todo-keyword-faces
;;       '(
;;         ("INPR" . (:foreground "yellow" :weight bold))
;;         ("DONE" . (:foreground "green" :weight bold))
;;         ("IMPEDED" . (:foreground "red" :weight bold))
;;         ))


;; No menu bars
(menu-bar-mode -1)

;; (when window-system
;;   (setq frame-title-format '(buffer-file-name "%f" ("%b")))
;;   (turn-off-tool-bar)
;;   (tooltip-mode -1)
;;   (turn-off-tool-bar)
;;   (blink-cursor-mode -1))

;; (add-hook 'before-make-frame-hook 'turn-off-tool-bar)

;; Ditch them scrollbars
(scroll-bar-mode -1)

;; Make zooming affect frame instead of buffers
;; (require 'zoom-frm)

;; Sweet window-splits
;; (defadvice split-window-right (after balance activate) (balance-windows))
;; (defadvice delete-window (after balance activate) (balance-windows))

(provide 'appearance)
