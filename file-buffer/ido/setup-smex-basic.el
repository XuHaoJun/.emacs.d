;;; Require package: (smex)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))

;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; Use C-x C-m to do M-x per Steve Yegge's advice
(global-set-key (kbd "C-x C-m") 'smex)

(provide 'setup-smex-basic)
