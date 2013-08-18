(require 'evil)

(setq evil-default-cursor t)
(setq evil-auto-indent t)
(setq evil-find-skip-newlines t)
(setq evil-move-cursor-back nil)
(setq evil-cross-lines t)
(setq evil-mode-line-format nil)
(setq evil-want-visual-char-semi-exclusive t)

(evil-set-initial-state 'term-mode       'emacs)
(evil-set-initial-state 'ansi-term       'emacs)
(evil-set-initial-state 'inf-ruby-mode   'emacs)
;; For dired use v/q
(evil-set-initial-state 'dired-mode      'emacs)
(evil-set-initial-state 'conf-space-mode 'emacs)

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

(defvar electrify-return-match
  "[\]}\)\"]<"
  "If this regexp matches the text after the cursor, do an \"electric\"
  return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(add-hook 'prog-mode-hook
          (lambda () (define-key evil-insert-state-local-map (kbd "RET") 'electrify-return-if-match)))

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
