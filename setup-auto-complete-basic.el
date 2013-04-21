(require 'auto-complete-config)
(ac-config-default)
(setq-default ac-sources (append ac-sources '(ac-source-files-in-current-dir ac-source-filename)))
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130209.651/dict")
(setq ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed

(define-key ac-mode-map  [(control return)] 'auto-complete)  
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)

;;----------------------------------------------------------------------------
;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;;----------------------------------------------------------------------------
(setq tab-always-indent 'complete) ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)

;; hook AC into completion-at-point
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; enhance pop-up
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t

;;show help window
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)

;; delete char but still can auto-complete
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

;;fuzzy match,that if you type error keyword then you still want to use ac; use it!
(require 'fuzzy)
(setq ac-fuzzy-enable t)

(provide 'setup-auto-complete-basic)

