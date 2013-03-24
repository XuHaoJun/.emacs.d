(require 'term)
(defvar my-term-shell "/bin/zsh") ; 执行ansi-term时不询问采用的shell

(defadvice ansi-term (after ansi-term-after-advice (arg))
  "run hook as after advice"
  (run-hooks 'ansi-term-after-hook))
(ad-activate 'ansi-term)

(defun my-term-hook ()
  (goto-address-mode))
(add-hook 'term-mode-hook 'my-term-hook)

;; disable other mirror mode
(add-hook 'term-mode-hook (lambda()
                            (linum-mode -1)
                            (yas-minor-mode -1)
                            (helm-mode -1)))

(defadvice term-sentinel (around my-advice-term-sentinel (proc msg) activate) ; ansi-term里exit命令会关闭buffer
    (if (memq (process-status proc) '(signal exit))
              (let ((buffer (process-buffer proc)))
                        ad-do-it
                                (kill-buffer buffer))
          ad-do-it))

(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

;; (custom-set-variables
;;  '(fringe-mode nil nil (fringe))
;;  '(fringes-outside-margins t t))
;; ;;Use Emacs terminfo, not system terminfo
;; (setq system-uses-terminfo nil)

(provide 'setup-term)
