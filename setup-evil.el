(require 'undo-tree)
(require 'evil)

(setq evil-default-cursor t)
(setq evil-auto-indent t)
(setq evil-find-skip-newlines t)
(setq evil-move-cursor-back nil)
(setq evil-cross-lines t)

(evil-set-initial-state 'term-mode 'emacs)
(evil-set-initial-state 'ansi-term 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)

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

(setq evil-mode-line-format nil)
(evil-mode t)

;; AceJump is a nice addition to evil's standard motions.
;; The following definitions are necessary to define evil motions for ace-jump-mode (version 2).
;; ace-jump is actually a series of commands which makes handling by evil
;; difficult (and with some other things as well), using this macro we let it
;; appear as one.
(require 'ace-jump-mode)
(defmacro evil-enclose-ace-jump (&rest body)
  `(let ((old-mark (mark)))
     (remove-hook 'pre-command-hook #'evil-visual-pre-command t)
     (remove-hook 'post-command-hook #'evil-visual-post-command t)
     (unwind-protect
         (progn
           ,@body
           (recursive-edit))
       (if (evil-visual-state-p)
           (progn
             (add-hook 'pre-command-hook #'evil-visual-pre-command nil t)
             (add-hook 'post-command-hook #'evil-visual-post-command nil t)
             (set-mark old-mark))
         (push-mark old-mark)))))

(evil-define-motion evil-ace-jump-char-mode (count)
  :type exclusive
  (evil-enclose-ace-jump
   (ace-jump-mode 5)))

(evil-define-motion evil-ace-jump-line-mode (count)
  :type line
  (evil-enclose-ace-jump
   (ace-jump-mode 9)))

(evil-define-motion evil-ace-jump-word-mode (count)
  :type exclusive
  (evil-enclose-ace-jump
   (ace-jump-mode 1)))

(evil-define-motion evil-ace-jump-char-to-mode (count)
  :type exclusive
  (evil-enclose-ace-jump
   (ace-jump-mode 5)
   (forward-char -1)))
;; some proposals for binding:
(define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-word-mode)
(define-key evil-motion-state-map (kbd "C-SPC") #'evil-ace-jump-line-mode)
(define-key evil-motion-state-map (kbd "M-SPC") #'evil-ace-jump-char-mode)

(define-key evil-operator-state-map (kbd "SPC") #'evil-ace-jump-word-mode)      ; similar to f
(define-key evil-operator-state-map (kbd "C-SPC") #'evil-ace-jump-line-to-mode) ; similar to t
(define-key evil-operator-state-map (kbd "M-SPC") #'evil-ace-jump-char-mode)
;; different jumps for different visual modes
;; (defadvice evil-visual-line (before spc-for-line-jump activate)
;;   (define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-line-mode))

;; (defadvice evil-visual-char (before spc-for-char-jump activate)
;;   (define-key evil-motion-state-map (kbd "SPC") #'evil-ace-jump-char-mode))

;; (defadvice evil-visual-block (before spc-for-char-jump activate)
;;   (define-key evil-visual-state-map (kbd "M-k") 'mark-previous-like-this)
;;   evil-motion-state-map (kbd "SPC") #'evil-ace-jump-char-mode)


;; (require 'mark-multiple)
;; ;;Easy access to the mark multiple library when in visual-mode
;; (define-key evil-visual-state-map (kbd "M-j") 'mark-next-like-this)
;; (define-key evil-visual-state-map (kbd "M-k") 'mark-previous-like-this)

;; emulates surround.vim
(require 'surround)
(global-surround-mode 1)

;; (require 'ecb)
;; (define-key evil-normal-state-map (kbd "C-w C-e") 'ecb-toggle-ecb-windows) ;;toggle ecb

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

(require 'evil-leader)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "," 'smex
  "#" 'rgr/ido-erc-buffer
  "%" 'ido-term-buffer
  "0" 'delete-window
  "1" 'delete-other-windows
  "2" 'split-window-below
  "3" 'split-window-right
  "b" 'ido-switch-buffer
  "B" 'ibuffer
  "c" 'recompile
  "C" 'compile
  "d" 'ido-dired
  "e" 'er/expand-region
  "f" 'ido-find-file
  "F" 'recentf-ido-find-file
  "g" 'magit-status
  "G" 'magit-log
  "i" 'flex-isearch-forward
  "I" 'flex-isearch-backward
  "k" 'kill-buffer
  "K" 'kill-buffer-and-window
  "r" 'vr/replace
  "R" 'vr/query-replace
  "s" 'save-buffer
  "S" 'save-some-buffers
  "t" 'gtags-find-tag
  "T" 'gtags-find-symbol)


(provide 'setup-evil)
