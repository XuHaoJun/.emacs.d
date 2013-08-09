(defun indent-on-window ()
  "indent whole buffer and untabify it"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (window-start) (window-end) nil)
  (untabify (point-min) (point-max)))

(provide 'util-indent)
