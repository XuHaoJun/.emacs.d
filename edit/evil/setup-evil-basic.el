(require 'evil)

(setq evil-default-cursor t)
(setq evil-auto-indent t)
(setq evil-find-skip-newlines t)
(setq evil-move-cursor-back nil)
(setq evil-cross-lines t)
(setq evil-mode-line-format nil)
(setq evil-want-visual-char-semi-exclusive t)

(evil-set-initial-state 'term-mode 'emacs)
(evil-set-initial-state 'ansi-term 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)

(add-hook 'prog-mode-hook
          (lambda ()

            (defun get-current-line-text ()
              (progn
                (let (p1 p2 myLine)
                  (setq p1 (line-beginning-position) )
                  (setq p2 (line-end-position) )
                  (setq myLine (buffer-substring-no-properties p1 p2)))))

            (eval-after-load 'evil-mode
              (defadvice evil-insert (after evil-insert-state activate)
                (when (and evil-auto-indent
                           (or (string-match "[[:space:]]+" (get-current-line-text))
                               (string-match "^$" (get-current-line-text))))
                  (indent-according-to-mode))))))

;; Modified version of evil-ret that moves the cursor to the first
;; non-blank on the line, like vim.
(evil-define-motion rob/evil-ret (count)
  "Move the cursor COUNT lines down.
If point is on a widget or a button, click on it.
In Insert state, insert a newline."
  :type line
  (let* ((field  (get-char-property (point) 'field))
         (button (get-char-property (point) 'button))
         (doc    (get-char-property (point) 'widget-doc))
         (widget (or field button doc)))
    (cond
     ((and widget
           (fboundp 'widget-type)
           (fboundp 'widget-button-press)
           (or (and (symbolp widget)
                    (get widget 'widget-type))
               (and (consp widget)
                    (get (widget-type widget) 'widget-type))))
      (when (evil-operator-state-p)
        (setq evil-inhibit-operator t))
      (when (fboundp 'widget-button-press)
        (widget-button-press (point))))
     ((and (fboundp 'button-at)
           (fboundp 'push-button)
           (button-at (point)))
      (when (evil-operator-state-p)
        (setq evil-inhibit-operator t))
      (push-button))
     ((or (evil-emacs-state-p)
          (and (evil-insert-state-p)
               (not buffer-read-only)))
      (if (not evil-auto-indent)
          (newline count)
        (delete-horizontal-space t)
        (newline count)
        (indent-according-to-mode)))
     (t
      (evil-next-line count)
      (evil-first-non-blank)))))

(define-key evil-motion-state-map (kbd "RET") 'rob/evil-ret)

;; Emacs key 
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'evil-end-of-line)

;; Evil key
(evil-define-operator evil-yank-line-end (beg end type register)
  "Yank to end of line."
  :motion evil-end-of-line
  (interactive "<R><x>")
  (evil-yank beg end type register))
(define-key evil-normal-state-map "Y" 'evil-yank-line-end)

(provide 'setup-evil-basic)
