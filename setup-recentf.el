(require 'recentf)

;; (setq recentf-auto-cleanup 10)
(setq recentf-exclude '(".recentf"))
(setq recentf-max-saved-items 2000)
;; (setq recentf-auto-save-timer
;;       (run-with-idle-timer 300 t 'recentf-save-list))
(recentf-mode 1)

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let* ((file-assoc-list
	  (mapcar (lambda (x)
		    (cons (file-name-nondirectory x)
			  x))
		  recentf-list))
	 (filename-list
	  (remove-duplicates (mapcar #'car file-assoc-list)
			     :test #'string=))
	 (filename (ido-completing-read "Choose recent file: "
					filename-list
					nil
					t)))
    (when filename
      (find-file (cdr (assoc filename
			     file-assoc-list))))))

;; ido select for short view
(global-set-key (kbd "C-x F") 'recentf-ido-find-file)
;; helm select for verbose view
(global-set-key (kbd "C-x f") 'helm-recentf)


(provide 'setup-recentf)
