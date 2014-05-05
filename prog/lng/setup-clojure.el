;; require package (clojure-mode cider ac-nrepl kibit-mode)

(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; (require 'ac-cider-compliment)
;; (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;; (add-hook 'cider-mode-hook 'ac-cider-compliment-setup)
;; (add-hook 'cider-repl-mode-hook 'ac-cider-compliment-repl-setup)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-repl-mode))
;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))
;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; (require 'ac-nrepl)
;; (add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
;; (add-hook 'cider-mode-hook 'ac-nrepl-setup)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-repl-mode))
;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))
;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(defun clojure-mysetup ()
  (rainbow-delimiters-mode 1)
  (smartparens-mode 1))

(add-hook 'clojure-mode-hook 'clojure-mysetup)


(defun cider-repl-mysetup ()
  (rainbow-delimiters-mode 1)
  (smartparens-mode 1)
  (define-key evil-normal-state-local-map "gd" 'cider-jump)
  (define-key evil-normal-state-local-map "gD" 'cider-jump-back)
  (define-key evil-normal-state-local-map (kbd "RET") 'cider-repl-return))

(add-hook 'cider-repl-mode-hook 'cider-repl-mysetup)


(defun cider-mysetup ()
  (define-key evil-normal-state-local-map "gd" 'cider-jump)
  (define-key evil-normal-state-local-map "gD" 'cider-jump-back))

(add-hook 'cider-mode-hook 'cider-mysetup)

(provide 'setup-clojure)
