(require 'erc)

;;; Hide spam
;Because channel too many people,so someone 'join' 'quit' will let you
;see too more spam.
;; Don't spam me bro  
(setq erc-hide-list '("JOIN" "PART" "QUIT"))  
;; Don't spam my modeline.  
(require 'erc-track)  
(erc-track-mode 1)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"  
                                "324" "329" "332" "333" "353" "477"))
;;; End of Hide spam

;;; Log save
(erc-log-mode)
(setq erc-log-channels t
      erc-log-channels-directory "~/.emacs.d/.erc.d"
      erc-log-insert-log-on-open nil
      erc-log-file-coding-system 'utf-8)
;; auto-saving log files on channel activity
(setq erc-save-buffer-on-part nil
      erc-save-queries-on-quit nil
      erc-log-write-after-send t
      erc-log-write-after-insert t)
;;; end of Log save

(provide 'setup-erc)
