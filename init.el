(require 'server)
(unless (server-running-p)
  (server-start))

;;; need early run in start up
;; turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; no splash screen please ... jeez
(setq inhibit-startup-message t)
;;; End of need early run in start up

;;; setup path
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
;;; End of setup path

;;; setup backup
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
;; write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
;;; End of setup backup

;;; setup packages
(require 'setup-package)
;; install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'ace-jump-mode melpa)
   (cons 'ack gnu)
   (cons 'auctex gnu)
   (cons 'auto-complete melpa)
   (cons 'auto-complete-clang melpa)
   (cons 'android-mode marmalade)
   (cons 'browse-kill-ring melpa)
   (cons 'company melpa)
   (cons 'dynamic-fonts melpa)
   (cons 'ecb melpa)
   (cons 'emacs-eclim melpa)
   (cons 'erc-hl-nicks melpa)
   (cons 'evil melpa)
   (cons 'flymake melpa)
   (cons 'flymake-cursor melpa)
   (cons 'fuzzy melpa)
   (cons 'ggtags gnu)
   (cons 'helm melpa)
   (cons 'helm-ack melpa)
   (cons 'helm-gtags melpa)
   (cons 'ibuffer-vc melpa)
   (cons 'ido-hacks melpa)
   (cons 'ido-ubiquitous melpa)
   (cons 'magit melpa)
   (cons 'pos-tip melpa)
   (cons 'savekill melpa)
   (cons 'session melpa)
   (cons 'shell-pop melpa)
   (cons 'smex melpa)
   (cons 'smartparens melpa)
   (cons 'smooth-scrolling melpa)
   (cons 'solarized-theme melpa)
   (cons 'surround melpa)
   (cons 'switch-window melpa)
   (cons 'undo-tree melpa)
   (cons 'w3m melpa)
   (cons 'yasnippet melpa)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))
;;; End of setup packages


;;; basic settings
(require 'key-bindings)
(require 'appearance)
(require 'sane-defaults) ;; lets start with a smattering of sanity
;;; End of basic settings

;;; language special setup
(require 'setup-cc-mode)
;;; End of language special setup

;;; build-in extensions
(require 'setup-hippie-expand)
(require 'setup-recentf)
(require 'setup-term)
;;; End of build-in extensions

;;; other extensions 
(require 'auto-complete)
(eval-after-load 'auto-complete '(require 'setup-auto-complete))
(eval-after-load 'auto-complete '(require 'setup-auto-complete-clang))
(require 'setup-browse-kill-ring)
;; (require 'setup-ecb)
(require 'setup-erc)
(require 'setup-evil)
(require 'setup-flymake)
(eval-after-load 'flymake '(require 'setup-flymake-clang))
(eval-after-load 'flymake '(require 'setup-flymake-tex))
(require 'setup-ido)
(require 'setup-helm)
(require 'setup-ibuffer)
(require 'setup-shell-pop)
(require 'setup-tex)
(require 'setup-undo-tree)
(require 'setup-w3m)
(require 'setup-yasnippet)

(require 'switch-window)
(require 'transpose-frame)
(require 'erc-hl-nicks)

(require 'magit)
(add-hook 'magit-mode-hook (lambda() (linum-mode -1)))

(require 'smartparens-config)
(smartparens-global-mode)

(require 'window-numbering)
(custom-set-faces '(window-numbering-face ((t (:weight bold)))))
(window-numbering-mode 1)
;;; End of other extensions 

;;; Android plugin
(require 'eclim)
(require 'eclimd)
;; (global-eclim-mode)
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
;; (global-company-mode t)
;;; End of Android plugin

;;; save or load last full emacs status
;; Restore emacs status after load all my setting and mode.
(require 'setup-session)
;;; End of save or load last full emacs status
