;; If you want use syntax check or style check gem install rubocop
;; and enable flycheck mode


(require 'ruby-mode)

(dolist (file-pattern '("Rakefile\\'" "\\.rake\\'" "Gemfile\\'"))
  (add-to-list 'auto-mode-alist (cons file-pattern '(. ruby-mode))))

;; Let emacs find my local gem in my home.
(setenv "GEM_HOME" (expand-file-name "~/.gem"))

(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "[[") 'ruby-beginning-of-block)
            (define-key evil-normal-state-local-map (kbd "]]") 'ruby-end-of-block)
            (define-key evil-motion-state-local-map (kbd "]]") 'ruby-end-of-block)
            (define-key evil-motion-state-local-map (kbd "]]") 'ruby-end-of-block)))

(require 'yari)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
(add-hook 'ruby-mode-hook
          (lambda () (define-key evil-insert-state-local-map (kbd "RET") 'ruby-electric-return)))

(require 'ruby-block)
(add-hook 'ruby-mode-hook 'ruby-block-mode)

(require 'inf-ruby)
(setq inf-ruby-implementations
      '(("ruby" . "irb --prompt my-default -r irb/completion")))

;; Use .irbrc and set default's :PROMPT_S => nil,
;; then it can work on my robe and correctly output prompt
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'robe
  '(add-hook 'robe-mode-hook
             (lambda ()
               (add-to-list 'ac-sources 'ac-source-robe))))

;; ;; ruby #{rsense-home}/etc/config.rb ~/.rsense"
;; ;; to generate config file (for use ruby2.0)
;; (when (executable-find "rsense")
;;   (setq rsense-home "/opt/rsense-0.3")
;;   (require 'rsense)
;;   (add-hook 'ruby-mode-hook
;;             (lambda ()
;;               (add-to-list 'ac-sources 'ac-source-rsense))))

(provide 'setup-ruby-mode)
