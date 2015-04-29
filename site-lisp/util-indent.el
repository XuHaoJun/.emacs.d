(defun indent-on-page ()
  "indent whole buffer and untabify it"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (window-start) (window-end) nil)
  (untabify (point-min) (point-max)))

(defun indent-on-buffer ()
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(provide 'util-indent)
