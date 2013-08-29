;;;  If you want use syntax check or style check gem install rubocop
;;; and enable flycheck mode.
;;;  The file depend on (robe yari ruby-electric ruby-block inf-ruby
;;; evil auto-complete) .

(require 'ruby-mode)
(require 'yari) ; Yet Another RI interface
(dolist (file-pattern '("Rakefile\\'" "\\.rake\\'" "Gemfile\\'"))
  (add-to-list 'auto-mode-alist (cons file-pattern '(. ruby-mode))))
;; Let emacs find my local gem in my home.
(setenv "GEM_HOME" (expand-file-name "~/.gem"))
;; I bind it on evil-leader see setup-evil-leader.el file
(defun ruby-send-region-or-block (start end)
  (interactive "r")
  (if mark-active
      (ruby-send-region start end)
    (ruby-send-block)))
(defun ruby-send-current-line ()
  (interactive)
  (save-excursion
    (end-of-line)
    (let ((end (point)))
      (beginning-of-line)
      (ruby-send-region (point) end))))
;; Bind on evil
(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "[[") 'ruby-beginning-of-block)
            (define-key evil-normal-state-local-map (kbd "]]") 'ruby-end-of-block)
            (define-key evil-motion-state-local-map (kbd "]]") 'ruby-end-of-block)
            (define-key evil-motion-state-local-map (kbd "]]") 'ruby-end-of-block)))


(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)
;; Bind on evil
(add-hook 'ruby-mode-hook
          (lambda () (define-key evil-insert-state-local-map (kbd "RET") 'ruby-electric-return)))
;; Change from source Version: 20130127.1902
(defun ruby-electric-space (arg)
  (interactive "P")
  (self-insert-command (prefix-numeric-value arg))
  (cond ((ruby-electric-space-can-be-expanded-p)
         (save-excursion
           (ruby-indent-line t)
           (newline)
           (ruby-electric-insert-end)))
        ((ruby-electric-space-can-be-indent-p) (ruby-indent-line t))))

(defun ruby-electric-space-can-be-indent-p ()
  (and (ruby-electric-code-at-point-p)
       (ruby-electric-matching-word-p)))

(defun ruby-electric-matching-word-p ()
  (save-excursion
    (backward-word)
    (string-match "\\(\\<else\\>\\|\\<elsif\\>\\)" (current-word))))


(require 'ruby-block)
(add-hook 'ruby-mode-hook 'ruby-block-mode)


(require 'inf-ruby)
(setq inf-ruby-implementations
      '(("ruby" . "irb --prompt my-default -r irb/completion")))


;; Use .irbrc and set default's :PROMPT_S => nil,
;; then it can work on my robe and correctly output prompt
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
;; Add to auto-complete
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
