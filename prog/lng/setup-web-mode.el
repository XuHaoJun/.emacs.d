;; depend on evil and emmet
(require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

(add-hook 'web-mode-hook 'emmet-mode)

(add-hook 'web-mode-hook
          (lambda ()
            (define-key evil-motion-state-local-map (kbd "%")
              'web-mode-tag-match)
            (define-key evil-insert-state-local-map (kbd "<tab>")
              'emmet-expand-yas)))
;; (add-to-list 'ac-modes 'web-mode)

(provide 'setup-web-mode)
