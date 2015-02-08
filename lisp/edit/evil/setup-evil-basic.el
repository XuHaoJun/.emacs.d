(setq evil-default-cursor t)
(setq evil-auto-indent t)
(setq evil-find-skip-newlines t)
(setq evil-move-cursor-back nil)
(setq evil-cross-lines t)
(setq evil-mode-line-format nil)
(setq evil-want-visual-char-semi-exclusive t)
(setq evil-regexp-search t)
(setq evil-want-C-i-jump t)


(defun current-line-text ()
  (progn
    (let (p1 p2 myLine)
      (setq p1 (line-beginning-position))
      (setq p2 (line-end-position))
      (setq myLine (buffer-substring-no-properties p1 p2)))))

(defun setup-evil-insert-and-indent ()
  (defadvice evil-insert (after evil-insert-state activate)
    (when (derived-mode-p 'prog-mode 'clojure-parent-mode 'rust-mode)
      (when (and evil-auto-indent
                 (or (string-match "^[[:space:]]+$" (current-line-text))
                     (string-match "^$" (current-line-text))))
        (indent-according-to-mode)))))

(add-hook 'prog-mode-hook 'setup-evil-insert-and-indent)

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

;; Keep cursor position and insert newline.
(defun open-line-below (n)
  (interactive "*p")
  (save-excursion
    (evil-end-of-line)
    (open-line n)))
(add-hook 'prog-mode-hook
          (lambda ()
            (define-key evil-insert-state-local-map (kbd "S-<return>") 'open-line-below)
            (define-key evil-normal-state-local-map (kbd "S-<return>") 'open-line-below)))

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

(require 'evil-numbers)

(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)


;; change mode-line color by evil state
(when (not (window-system))
  (lexical-let ((default-color (cons (face-background 'mode-line)
                                     (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
              (lambda ()
                (let ((color (cond ((minibufferp) default-color)
                                   ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                                   ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                                   ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                                   (t default-color))))
                  (set-face-background 'mode-line (car color))
                  (set-face-foreground 'mode-line (cdr color)))))))

(add-hook 'prog-mode-hook (lambda ()
                            (define-key evil-motion-state-local-map "gs" 'ido-goto-symbol)))

(provide 'setup-evil-basic)
