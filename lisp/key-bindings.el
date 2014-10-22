
(global-set-key "\M-/" 'hippie-expand)

;; open other file in new window
(define-key global-map "\C-xv" 'find-file-other-window)

;; Make CTRL-h delete the previous character. Normally, this gets 
;; you into the "help" system.
(global-set-key "\C-h" 'delete-backward-char)
;; make sure CTRL-h works in searches, too
(setq search-delete-char (string-to-char "\C-h"))

(defun kill-region-or-word ()
  "Call `kill-region' or `backward-kill-word' depending on
whether or not a region is selected."
  (interactive)
  (if (and transient-mark-mode mark-active)
      (kill-region (point) (mark))
    (backward-kill-word 1)))
(global-set-key "\C-w" 'kill-region-or-word)

(provide 'key-bindings)
