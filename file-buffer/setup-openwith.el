(require 'openwith)

(setq openwith-associations
            (list
             (list (openwith-make-extension-regexp
                    '("mpg" "mpeg" "mp3" "mp4"
                      "avi" "wmv" "wav" "mov" "flv"
                      "ogm" "ogg" "mkv" "ogv"))
                   "smplayer"
                   '(file))
             ;; (list (openwith-make-extension-regexp
             ;;        '("xbm" "pbm" "pgm" "ppm" "pnm"
             ;;          "png" "gif" "bmp" "tif" "jpeg" "jpg"))
             ;;       "ristretto"
             ;;       '(file))
             (list (openwith-make-extension-regexp
                    '("doc" "xls" "ppt" "odt" "ods" "odg" "odp"))
                   "libreoffice"
                   '(file))
             '("\\.chm" "chmsee" (file))
             (list (openwith-make-extension-regexp
                    '("pdf" "ps" "ps.gz" "dvi"))
                   "zathura"
                   '(file))
             ))

(openwith-mode t)

(provide 'setup-openwith)
