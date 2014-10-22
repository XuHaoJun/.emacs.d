(require 'dired)
;; Recursive do copy or delete.
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote always))


;; ;; Extends functionalities provided by GNU Emacs's dired.el
;; (require 'dired+)


;; Let dired can hide details
(require 'dired-details)
(require 'dired-details+)
(dired-details-install)
(setq dired-details-initially-hide nil)


;; Hate dired gen too more buffer,let only one buffer.
(require 'dired-single)
(setq dired-single-last-single-buffer-pos nil)
(defun dired-single-last-single-buffer (&optional default-dirname)
  (interactive)
  (dired-single-buffer "..")
  (if dired-single-last-single-buffer-pos
      (goto-char (pop dired-single-last-single-buffer-pos))))

(defun setup-dired-single-keys ()
  (define-key dired-mode-map (kbd "l") (lambda () (interactive)
                                         (when (file-directory-p (dired-get-filename nil t))
                                           (push (point) dired-single-last-single-buffer-pos))
                                         (dired-single-buffer)))
  (define-key dired-mode-map (kbd "h") (lambda () (interactive) (dired-single-last-single-buffer)))
  (define-key dired-mode-map (kbd "j") 'dired-next-line)
  (define-key dired-mode-map (kbd "k") 'dired-previous-line)
  (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
  (define-key dired-mode-map (kbd "<mouse-1>") 'dired-single-buffer-mouse))
(setup-dired-single-keys)

;; Hide dotfiles and . like 'ls'
(require 'dired-x)
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))

(require 'wdired)
(define-key dired-mode-map "\C-c\C-e" 'wdired-change-to-wdired-mode)

(define-key dired-mode-map (kbd "/") 'dired-isearch-filenames-regexp)

(provide 'setup-dired)
