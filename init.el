(server-start)

;;; need early run in start up
;; turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; no splash screen please ... jeez
(setq inhibit-startup-message t)
;;; end of need early run in start up

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
;;; end of setup path

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
;;; end of setup backup

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
   (cons 'dynamic-fonts melpa)
   (cons 'ecb melpa)
   (cons 'evil melpa)
   (cons 'flymake melpa)
   (cons 'flymake-cursor melpa)
   (cons 'fuzzy melpa)
   (cons 'ggtags gnu)
   (cons 'helm melpa)
   (cons 'helm-ack melpa)
   (cons 'helm-gtags melpa)
   (cons 'ido-ubiquitous melpa)
   ;; (cons 'expand-region melpa)
   (cons 'magit melpa)
   (cons 'mark-multiple melpa)
   (cons 'multiple-cursors melpa)
   (cons 'org melpa)
   (cons 'pos-tip melpa)
   (cons 'savekill melpa)
   (cons 'session melpa)
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
;;; end of setup packages


;;; basic settings
(require 'key-bindings)
(require 'appearance)
(require 'sane-defaults) ;; lets start with a smattering of sanity
;;; end of basic settings

;;; language special setup
(require 'setup-cc-mode)
;;; end of language special setup

;;; build-in extensions
(require 'setup-hippie-expand)
(require 'setup-recentf)
(require 'setup-term)
;;; end of build-in extensions

;;; other extensions 
(require 'auto-complete)
(eval-after-load 'auto-complete '(require 'setup-auto-complete))
(eval-after-load 'auto-complete '(require 'setup-auto-complete-clang))
(require 'setup-browse-kill-ring)
;; (require 'setup-ecb)
(require 'setup-evil)
(require 'setup-flymake)
(eval-after-load 'flymake '(require 'setup-flymake-tex))
(require 'setup-ido)
(require 'setup-helm)
(require 'setup-ibuffer)
(require 'setup-session)
(require 'setup-shell-pop)
(require 'setup-tex)
(require 'setup-undo-tree)
(require 'setup-w3m)
(require 'setup-yasnippet)

(require 'switch-window)
(require 'transpose-frame)

(require 'magit)
(add-hook 'magit-mode-hook (lambda() (linum-mode -1)))

(require 'smartparens-config)
(smartparens-global-mode)

(require 'window-numbering)
;; highlight the window number in pink color
(custom-set-faces '(window-numbering-face ((t (:foreground "SteelBule" :underline "SteelBule4" :weight bold)))))
(window-numbering-mode 1)
;;; end of other extensions 

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
;;; end of Android plugin

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-indent-next-pair-timer-geo-mean (quote ((default 0.0005 0))))
 '(desktop-base-file-name ".emacs.desktop")
 '(desktop-dirname "~/.emacs.d/" t)
 '(desktop-path (quote ("~/.emacs.d/")))
 '(desktop-save-mode 1)
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.9)
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#839496" :background "#002b36")))))
