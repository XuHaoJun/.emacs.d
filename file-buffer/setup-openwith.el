(require 'openwith)

(setq openwith-associations
      (remove-if nil
                 (list
                  (when (executable-find "smplayer")
                    (list (openwith-make-extension-regexp
                           '("mpg" "mpeg" "mp3" "mp4"
                             "avi" "wmv" "wav" "mov" "flv"
                             "ogm" "ogg" "mkv" "ogv"))
                          "smplayer"
                          '(file)))
                  ;; (when (executable-find "feh")
                  ;;   (list (openwith-make-extension-regexp
                  ;;          '("xbm" "pbm" "pgm" "ppm" "pnm"
                  ;;            "png" "gif" "bmp" "tif" "jpeg" "jpg"))
                  ;;         "feh -FZ"
                  ;;         '(file)))
                  (when (executable-find "libreoffice")
                    (list (openwith-make-extension-regexp
                           '("doc" "xls" "ppt" "odt" "ods" "odg" "odp"))
                          "libreoffice"
                          '(file)))
                  (when (executable-find "zathura")
                    (list (openwith-make-extension-regexp
                           '("pdf" "ps" "ps.gz" "dvi"))
                          "zathura"
                          '(file)))
                  (when (executable-find "chmsee")
                    '("\\.chm" "chmsee" (file))))))

(openwith-mode t)

(provide 'setup-openwith)
