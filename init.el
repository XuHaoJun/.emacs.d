;;;---------------------------------------------------------------------------
;;; Start emacs daemon
;;;---------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))
;;; End of Start emacs daemon


;;;---------------------------------------------------------------------------
;;; Need early run in start up
;;;---------------------------------------------------------------------------
;; turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; no splash screen please ... jeez
(setq inhibit-startup-message t)
;;; End of Need early run in start up


;;;---------------------------------------------------------------------------
;;; Setup path
;;;---------------------------------------------------------------------------
;; set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

;; set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)

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
;;; End of Setup packages


;;;---------------------------------------------------------------------------
;;; Appearance
;;;---------------------------------------------------------------------------
(require 'appearance)
;;; End of Appearance


;;;---------------------------------------------------------------------------
;;; Extensions
;;;---------------------------------------------------------------------------
;;--------------
;;   Edit
;;--------------
(add-to-list 'load-path (concat user-emacs-directory "edit"))

(add-to-list 'load-path (concat user-emacs-directory "edit/evil"))
(require 'setup-evil-init)
(require 'setup-undo-tree)
(require 'setup-smartparens)
(require 'setup-ack-and-a-half)
(require 'setup-ag)
(require 'setup-autopair)
(require 'setup-browse-kill-ring)
(require 'setup-wgrep)
(require 'setup-flex-isearch)

(require 'visual-regexp)
(require 'expand-region)
(require 'color-moccur)
(require 'moccur-edit)

;; (require 'indent-file)
;; (add-hook 'emacs-lisp-mode-hook 'indent-file-when-save)
;; (add-hook 'scheme-mode-hook 'indent-file-when-save)
;; (add-hook 'lisp-mode-hook 'indent-file-when-save)
;; (add-hook 'c-mode-common-hook 'indent-file-when-save)

;; End of Edit

;;----------------
;;   Programming
;;----------------
(add-to-list 'load-path (concat user-emacs-directory "prog"))

(add-to-list 'load-path (concat user-emacs-directory "prog/auto-complete"))
(require 'setup-auto-complete-init)
(add-to-list 'load-path (concat user-emacs-directory "prog/flymake"))
(require 'setup-flymake-init)
(require 'setup-compile)
(require 'setup-slime)
(require 'setup-eldoc)
(require 'setup-c-eldoc)
(require 'setup-yasnippet)
(require 'setup-gtags)
(require 'setup-git)
(require 'setup-auto-indentation)
;; (require 'setup-ecb)

;;-----------
;; Language special setup
;;-----------
(add-to-list 'load-path (concat user-emacs-directory "prog/lng"))
(require 'setup-cc-mode)
(require 'setup-scheme-mode)
(require 'setup-python-mode)
(require 'setup-tex)
;; End of Language special setup
;; End of Programming


;;--------------
;;   File and Buffer
;;--------------
(add-to-list 'load-path (concat user-emacs-directory "file-buffer"))

(add-to-list 'load-path (concat user-emacs-directory "file-buffer/ido"))
(require 'setup-ido-init)
(require 'setup-ibuffer)
(require 'setup-recentf)
(require 'setup-dired)
(require 'setup-helm)
(require 'setup-openwith)
(require 'setup-popwin)

(require 'switch-window)
;; End of File and Buffer

;;--------------
;;   Misc
;;--------------
(add-to-list 'load-path (concat user-emacs-directory "misc"))

(add-to-list 'load-path (concat user-emacs-directory "misc/term"))
(require 'setup-term-init)
(require 'setup-shell-pop)
(require 'setup-erc)
(require 'setup-stardict)
(require 'setup-w3m)
(require 'setup-newsticker)
;; End of Misc

;;-----------------
;; Android plugin
;;-----------------
(require 'setup-android-mode)
(require 'setup-eclim)
(require 'eclimd)
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
;; (global-company-mode t)
;; End of Android plugin
;;; End of Extensions


;;;---------------------------------------------------------------------------
;;; Basic settings
;;;---------------------------------------------------------------------------
(require 'key-bindings)
(require 'sane-defaults) ;; lets start with a smattering of sanity
(require 'setup-backup)
;;; End of Basic settings


;;;---------------------------------------------------------------------------
;;; Save or load last full emacs status
;;;---------------------------------------------------------------------------
;; Restore emacs status after load all my setting and mode.
(require 'setup-session)
;;; End of Save or load last full emacs status
