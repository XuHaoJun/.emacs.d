(require 'go-autocomplete)
(require 'go-mode-load)

(add-hook 'go-mode-hook 'go-eldoc-setup)

(add-hook 'go-mode-hook
          (lambda ()
            (define-key evil-motion-state-local-map "gd" 'godef-jump)
            (define-key evil-motion-state-local-map "gD" 'godef-jump-other-window)))

(add-hook 'go-mode-hook (lambda ()
                          (setq compilation-finish-functions nil)))
(defun go-run ()
  "run current buffer"
  (interactive)
  (compile (concat "go run " (buffer-file-name))))

;; (add-hook 'before-save-hook 'gofmt-before-save)

(provide 'setup-go-mode)
