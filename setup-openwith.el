(require 'openwith)

(setq openwith-associations '(("\\.pdf\\'" "zathura" (file))
                              ("\\.mov\\|\\.RM$\\|\\.RMVB$\\|\\.avi$\\|\\.AVI$\\|\\.flv$\\|\\.mp3\\|.mp4\\|\\.mkv$\\|\\.rmvb$" "mplayer" (file))
                              ("\\.CHM$\\|\\.chm$" "chmsee"  (file) )
                               ))
(openwith-mode t)

(provide 'setup-openwith)
