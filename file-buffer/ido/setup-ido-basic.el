;;; Require package: (ido)

(setq ido-enable-flex-matching t
      ido-case-fold nil
      ido-auto-merge-work-directories-length 0
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 10
      ido-default-buffer-method 'selected-window   ;; Allow the same buffer to be open in different frames
      ido-use-virtual-buffers nil
      ido-save-directory-list-file (concat user-emacs-directory ".ido.last")
      ido-use-faces nil)

(provide 'setup-ido-basic)
