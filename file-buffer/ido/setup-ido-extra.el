(require 'ido)

;; Always rescan buffer for imenu
(set-default 'imenu-auto-rescan t)

(add-to-list 'ido-ignore-directories "target")
(add-to-list 'ido-ignore-directories "node_modules")

(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))

(global-set-key "\C-ci" 'ido-goto-symbol) ; or any key you see fit

(defun wg/ido-for-mode (your-mode)
  (interactive)
  (let
      ((the-mode your-mode))
    (switch-to-buffer
     (ido-completing-read
      (format "Buffers of %s: " the-mode)
      (save-excursion
        (delq
         nil
         (mapcar
          (lambda
            (buf)
            (when
                (buffer-live-p buf)
              (with-current-buffer buf
                (and
                 (eq major-mode the-mode)
                 (buffer-name buf)))))
          (buffer-list))))))))

(defun wg/ido-for-this-mode ()
  (interactive)
  (wg/ido-for-mode major-mode))

(defun buffer-mode (buffer-or-name)
  (with-current-buffer buffer-or-name major-mode))

(defun buffer-all-major-mode ()
  (delete-dups (mapcar 'buffer-mode (buffer-list))))

(defun ido-buffer-major-mode ()
  (ido-completing-read
   "Major-mode:"
   (mapcar
    (lambda (x) (symbol-name x))
    (buffer-all-major-mode))))

(defun wg/ido-for-all-mode ()
  (interactive)
  (wg/ido-for-mode (intern (ido-buffer-major-mode))))

(defun wg/ido-term-buffer ()
  (interactive)
  (wg/ido-for-mode 'term-mode))

(defun wg/ido-erc-buffer ()
  (interactive)
  (wg/ido-for-mode 'erc-mode))

(defun wg/ido-dired-buffer ()
  (interactive)
  (wg/ido-for-mode 'dired-mode))

(provide 'setup-ido-extra)
