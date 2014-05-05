(require 'company)
(require 'company-go)
(global-company-mode)

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))))

(setq company-minimum-prefix-length 2)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-minimum-prefix-length 0)               ; autocomplete right after '.'
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

;; The useful keybindins from https://github.com/tcrayford/emacs/blob/master/vendor/slime-company.el
(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "\C-v") 'company-show-location)
(define-key company-active-map (kbd "<tab>") 'company-complete)
(define-key company-active-map (kbd "\C-g") '(lambda ()
                                               (interactive)
                                               (company-abort)))

(define-key company-active-map (kbd "<escape>") '(lambda ()
                                                   (interactive)
                                                   (company-abort)
                                                   (if (fboundp 'evil-normal-state)
                                                       (evil-normal-state))))

(provide 'setup-company)
