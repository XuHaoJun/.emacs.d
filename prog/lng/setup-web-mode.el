;;; Depend on evil and emmet
;;; I use <tab> key to complete code and <C-RET> to gen snippet by emmet.
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;; Use emmet replace yasnippet
(require 'emmet-mode)
(add-hook 'web-mode-hook
          (lambda ()
            (emmet-mode t)
            (yas-minor-mode -1)))

;; Sync emmet indent tab with web-mode
(add-hook 'emmet-mode-hook
          (lambda ()
            (setq emmet-indentation web-mode-markup-indent-offset)))

;;Evil-mode keybindings
(add-hook 'web-mode-hook
          (lambda ()
            (define-key evil-motion-state-local-map (kbd "%") 'web-mode-tag-match)
            (define-key evil-normal-state-local-map (kbd "%") 'web-mode-tag-match)))

;;Enable auto-complete-mode on web-mode
(add-to-list 'ac-modes 'web-mode)

(provide 'setup-web-mode)
