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
(require 'auto-install-packages)
;;; End of Setup packages


;;;---------------------------------------------------------------------------
;;; Appearance
;;;---------------------------------------------------------------------------
(require 'appearance)
;;; End of Appearance


;;;---------------------------------------------------------------------------
;;; Language special setup
;;;---------------------------------------------------------------------------
(require 'setup-cc-mode)
(require 'setup-scheme-mode)
(require 'setup-python-mode)
(require 'setup-tex)
;;; End of Language special setup


;;;---------------------------------------------------------------------------
;;; Extensions
;;;---------------------------------------------------------------------------
;;--------------
;;   Edit
;;--------------
(require 'setup-evil)
(require 'setup-undo-tree)
(require 'setup-ack-and-a-half)
(require 'setup-autopair)
(require 'setup-browse-kill-ring)
(require 'setup-wgrep)

(require 'visual-regexp)
(require 'expand-region)
(require 'color-moccur)
(require 'moccur-edit)

(require 'flex-isearch)
(global-flex-isearch-mode)

(require 'smartparens-config)
(add-hook 'scheme-mode-hook 'smartparens-mode)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'lisp-mode-hook 'smartparens-mode)

(require 'indent-file)
(add-hook 'emacs-lisp-mode-hook 'indent-file-when-save)
(add-hook 'scheme-mode-hook 'indent-file-when-save)
(add-hook 'lisp-mode-hook 'indent-file-when-save)
(add-hook 'c-mode-common-hook 'indent-file-when-save)

(when (executable-find "ag") (require 'ag))
(setq ag-highlight-search t)
(add-hook 'ag-mode-hook 'wgrep-ack-and-a-half-setup)
;; End of Edit

;;--------------
;;   Programming
;;--------------
(require 'setup-auto-complete)
(require 'setup-compile)
(require 'setup-flymake)
(require 'setup-eldoc)
(require 'setup-c-eldoc)
(require 'setup-yasnippet)
(require 'setup-global)
(require 'setup-git)
;; (require 'setup-ecb)

(require 'slime)
(setq inferior-lisp-program "/usr/bin/sbcl")
(slime-setup)
;; End of Programming

;;--------------
;;   File and Buffer
;;--------------
(require 'setup-ido)
(require 'setup-ibuffer)
(require 'setup-recentf)
(require 'setup-dired)
(require 'setup-helm)
(require 'setup-openwith)

(require 'switch-window)
;; End of File and Buffer

;;--------------
;;   LIFE
;;--------------
(require 'setup-term)
(require 'setup-shell-pop)
(require 'setup-erc)
(require 'setup-stardict)
(require 'setup-w3m)
(require 'setup-newsticker)
;; End of Life
;;; End of Extensions


;;;---------------------------------------------------------------------------
;;; Android plugin
;;;---------------------------------------------------------------------------
(require 'setup-android-mode)
(require 'setup-eclim)
(require 'eclimd)
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
;; (global-company-mode t)
;;; End of Android plugin


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
