(require 'evil)
(require 'ace-jump-mode)

;; AceJump is a nice addition to evil's standard motions.
;; The following definitions are necessary to define evil motions for ace-jump-mode (version 2).
;; ace-jump is actually a series of commands which makes handling by evil
;; difficult (and with some other things as well), using this macro we let it
;; appear as one.
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


(provide 'setup-evil-acejump)
