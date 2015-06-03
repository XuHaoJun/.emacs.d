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
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache$"  . web-mode))

(custom-set-variables
 '(web-mode-enable-auto-quoting nil))

(require 'flycheck)
(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."
  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (and (executable-find "jsxhint")
                       (equal web-mode-content-type "jsx"))
              (flycheck-select-checker 'jsxhint-checker))))

(setq web-mode-code-indent-offset 2)

;; Emmet
(add-hook 'emmet-mode-hook
          (lambda ()
            ;; Sync emmet indent tab with web-mode
            (setq emmet-indentation web-mode-markup-indent-offset)))

(add-hook 'web-mode-hook
          (lambda ()
            (emmet-mode)))

(provide 'setup-web-mode)
