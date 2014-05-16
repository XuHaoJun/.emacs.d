(require 'go-mode-load)

(require 'company-go)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-go))

;; (add-hook 'before-save-hook 'gofmt-before-save)
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

;; require autopair package
(add-hook 'go-mode-hook 'autopair-mode)

(add-hook 'go-mode-hook 'electric-indent-mode)

(defun go-electrify-return-if-match (arg)
  (interactive "P")
  (let ((left-point
         (if (<= (- (point) 1) (point-min))
             (point-min)
           (- (point) 1)))
        (right-point
         (if (>= (+ 1 (point)) (point-max))
             (point-max)
           (+ 1 (point)))))
    (message (buffer-substring-no-properties left-point right-point))
    (if (string= "{}"
                 (buffer-substring-no-properties left-point right-point))
        (progn
          (newline-and-indent)
          (previous-line)
          (end-of-line)
          (newline-and-indent))
      (electrify-return-if-match arg))))

(add-hook 'go-mode-hook
          (lambda () (define-key evil-insert-state-local-map (kbd "RET") 'go-electrify-return-if-match)))

(provide 'setup-go-mode)
