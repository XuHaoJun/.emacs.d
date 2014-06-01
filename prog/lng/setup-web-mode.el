;;; Require package: (evil emmet)
;;; Use <tab> key to complete code and <C-RET> to gen snippet by emmet.
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.go\\(html\\|tmpl\\)\\'"     . web-mode))

;; Emmet
(add-hook 'emmet-mode-hook
          (lambda ()
            ;; Sync emmet indent tab with web-mode
            (setq emmet-indentation web-mode-markup-indent-offset)
            ;; Use emmet-expand-yas not emmet-expand-line,because expand-line
            ;; not work with tab
            (define-key emmet-mode-keymap (kbd "<C-return>") 'emmet-expand-yas)))

(add-hook 'web-mode-hook
          (lambda ()
            (emmet-mode)
            (ac-emmet-html-setup)))

;;Enable auto-complete-mode on web-mode
(eval-after-load 'auto-complete
                 '(add-to-list 'ac-modes 'web-mode))

(provide 'setup-web-mode)
