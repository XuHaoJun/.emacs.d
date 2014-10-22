;;;---------------------------------------------------------------------------
;;; Setup path
;;;---------------------------------------------------------------------------
;; set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))
(setq base-setup-dir (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path base-setup-dir)

;; add external projects to load path
(dolist (project (directory-files site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))
;;; End of Setup path


;;;---------------------------------------------------------------------------
;;; Setup packages
;;;---------------------------------------------------------------------------
(require 'setup-package)
(require 'auto-install-packages)
(auto-install-packages)
;;; End of Setup packages


;;;---------------------------------------------------------------------------
;;; Basic settings
;;;---------------------------------------------------------------------------
(require 'appearance)
(require 'key-bindings)
(require 'sane-defaults) ;; lets start with a smattering of sanity
(require 'setup-backup)
;;; End of Basic settings


;;;---------------------------------------------------------------------------
;;; Plugins
;;;---------------------------------------------------------------------------
;;--------------
;;   Edit
;;--------------
(add-to-list 'load-path (concat base-setup-dir "/edit"))
(require 'init-edit-plugin)
;; End of Edit

;;----------------
;;   Programming
;;----------------
(add-to-list 'load-path (concat base-setup-dir "/prog"))
(require 'init-prog-plugin)
;; End of Programming

;;--------------
;;   File and Buffer
;;--------------
(add-to-list 'load-path (concat base-setup-dir "/file-buffer"))
(require 'init-file-buffer-plugin)
;; End of File and Buffer

;;--------------
;;   Misc
;;--------------
(add-to-list 'load-path (concat base-setup-dir "/misc"))
(require 'init-misc-plugin)
;; End of Misc
;;; End of Plugin


;;;---------------------------------------------------------------------------
;;; Save or load last full emacs status
;;;---------------------------------------------------------------------------
;; Restore emacs status after load all my setting and mode.
(require 'setup-session)
;;; End of Save or load last full emacs status
