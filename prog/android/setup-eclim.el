(require 'eclim)
(global-eclim-mode)

;; Variables
(setq 
 eclim-auto-save nil
 eclimd-wait-for-process nil
 eclimd-default-workspace "~/workspace"
 help-at-pt-display-when-idle t
 help-at-pt-timer-delay 0.1)

;; Call the help framework with the settings above & activate
;; eclim-mode
(help-at-pt-set-timer)

(provide 'setup-eclim)
