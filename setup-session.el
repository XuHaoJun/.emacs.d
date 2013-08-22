(require 'setup-recentf)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'savekill)
(setq save-kill-file-name (expand-file-name "~/.emacs.d/.var/cache/kill-ring-saved.el"))

;; save a list of open files in ~/.emacs.desktop
;; save the desktop file automatically if it already exists
;;(setq desktop-save 'if-exists)
(require 'desktop)
(custom-set-variables
 '(desktop-base-file-name ".emacs.desktop")
 '(desktop-dirname "~/.emacs.d/" t)
 '(desktop-path (quote ("~/.emacs.d/")))
 '(desktop-save-mode t))
;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 30)
                (file-name-history        . 100)
                (grep-history             . 30)
                (compile-history          . 30)
                (minibuffer-history       . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                register-alist)))

(require 'session)
(add-hook 'after-init-hook
          'session-initialize)

;;; desktop-override-stale-locks.el begins here
(defun emacs-process-p (pid)
  "If pid is the process ID of an emacs process, return t, else nil.
Also returns nil if pid is nil."
  (when pid
    (let* ((cmdline-file (concat "/proc/" (int-to-string pid) "/cmdline")))
      (when (file-exists-p cmdline-file)
        (with-temp-buffer
          (insert-file-contents-literally cmdline-file)
          (goto-char (point-min))
          (search-forward "emacs" nil t)
          pid)))))

(defadvice desktop-owner (after pry-from-cold-dead-hands activate)
  "Don't allow dead emacsen to own the desktop file."
  (when (not (emacs-process-p ad-return-value))
    (setq ad-return-value nil)))
;;; desktop-override-stale-locks.el ends here

(require 'revive)
(add-hook 'kill-emacs-hook 'save-current-configuration)
(resume)

(provide 'setup-session)
