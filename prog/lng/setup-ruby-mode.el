;; If you want use syntax check or style check gem install rubocop
;; and enable flycheck mode

(require 'ruby-mode)

(dolist (file-pattern '("Rakefile\\'" "\\.rake\\'" "Gemfile\\'"))
  (add-to-list 'auto-mode-alist (cons file-pattern '(. ruby-mode))))

;; Let emacs find my local gem in my home.
(setenv "GEM_HOME" (expand-file-name "~/.gem"))

(require 'yari)

(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(require 'ruby-block)
(add-hook 'ruby-mode-hook 'ruby-block-mode)

(require 'inf-ruby)
(setq inf-ruby-implementations
      '(("ruby" . "irb --prompt-mode inf-ruby -r irb/completion -U")))

;; ruby #{rsense-home}/etc/config.rb ~/.rsense"
;; to generate config file (for use ruby2.0)
(when (executable-find "rsense")
  (setq rsense-home "/opt/rsense-0.3")
  (require 'rsense)
  (add-hook 'ruby-mode-hook
            (lambda ()
              (add-to-list 'ac-sources 'ac-source-rsense))))

(add-hook 'ruby-mode-hook
          (lambda ()
            (if (fboundp 'rsense-jump-to-definition)
                (progn
                  (define-key evil-motion-state-local-map (kbd "gd") 'rsense-jump-to-definition)
                  (define-key evil-normal-state-local-map (kbd "gd") 'rsense-jump-to-definition)
                  (define-key evil-motion-state-local-map (kbd "gD") 'evil-goto-definition)
                  (define-key evil-normal-state-local-map (kbd "gD") 'evil-goto-definition)))))

(provide 'setup-ruby-mode)
