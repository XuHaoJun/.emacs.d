(require 'multi-term)

(setq multi-term-program "/bin/zsh")
(setq multi-term-dedicated-select-after-open-p t)
(setq multi-term-dedicated-window-height 17)
(setq multi-term-dedicated-max-window-height 25)

(defun term-send-undo ()
  "Undo in term mode."
  (interactive)
  (term-send-raw-string "\C-_"))
(setq term-bind-key-alist
      (append '(("C-c C-s" . term-stop-subjob)
                ("C-/" . term-send-undo))
              term-bind-key-alist))

(global-set-key (kbd "C-<f9>") 'multi-term-dedicated-toggle)
(global-set-key (kbd "M-<f9>") 'multi-term)

(provide 'setup-multi-term)
