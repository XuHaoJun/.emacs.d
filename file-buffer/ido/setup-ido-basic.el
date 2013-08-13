(require 'ido)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length -1
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-buffer-method 'selected-window   ;; Allow the same buffer to be open in different frames
      ido-save-directory-list-file (concat user-emacs-directory ".ido.last"))

(add-hook
 'ido-setup-hook
 (lambda ()
   ;; Use C-w to go back up a dir to better match normal usage of C-w
   ;; - insert current file name with C-x C-w instead.
   (define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-updir)
   (define-key ido-file-completion-map (kbd "C-x C-w") 'ido-copy-current-file-name)))

(provide 'setup-ido-basic)
