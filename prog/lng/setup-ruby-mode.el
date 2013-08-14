;; Let emacs find my local gem in my home.
(setenv "GEM_HOME" (expand-file-name "~/.gem"))

;; Depend on extern program rsense.
;; (when (executable-find "rsense")
;;   (setq rsense-home "/opt/rsense-0.3")
;;   (require 'rsense)
;;   (add-hook 'ruby-mode-hook
;;             (lambda ()
;;               (add-to-list 'ac-sources 'ac-source-rsense-method)
;;               (add-to-list 'ac-sources 'ac-source-rsense-constant))))

(require 'yari)

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'robe
  '(add-hook 'robe-mode-hook
             (lambda ()
               (add-to-list 'ac-sources 'ac-source-robe))))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(require 'ruby-dev)
(add-hook 'ruby-mode-hook 'turn-on-ruby-dev)


(defun my-ruby-proc ()
  (interactive)
  (ruby-dev)
  (inf-ruby))


(provide 'setup-ruby-mode)
