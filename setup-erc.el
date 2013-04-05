(require 'erc)

;; Don't spam me bro  
(setq erc-hide-list '("JOIN" "PART" "QUIT"))  

;; Don't spam my modeline.  
(require 'erc-track)  
(erc-track-mode 1)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"  
                                "324" "329" "332" "333" "353" "477"))

(provide 'setup-erc)
