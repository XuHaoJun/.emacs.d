;; If you want use syntax check or style check gem install rubocop
;; and enable flycheck mode

(require 'ruby-mode)

(dolist (file-pattern '("Rakefile\\'" "\\.rake\\'" "Gemfile\\'"))
  (add-to-list 'auto-mode-alist (cons file-pattern '(. ruby-mode))))

;; Let emacs find my local gem in my home.
(setenv "GEM_HOME" (expand-file-name "~/.gem"))

(require 'yari)

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'robe
  '(add-hook 'robe-mode-hook
             (lambda ()
               (add-to-list 'ac-sources 'ac-source-robe))))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(require 'ruby-block)
(add-hook 'ruby-mode-hook 'ruby-block-mode)

(defun my-ruby-start ()
  (interactive)
  (progn
    (inf-ruby)
    (robe-start)))

(provide 'setup-ruby-mode)
