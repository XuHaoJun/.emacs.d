(defun indent-on-page ()
  "indent whole buffer and untabify it"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (window-start) (window-end) nil)
  (untabify (point-min) (point-max)))

(defun indent-on-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(provide 'util-indent)
