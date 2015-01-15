;;;  Require package:
;;; (robe yari ruby-electric ruby-block inf-ruby evil rinari)
;;; Useage:
;;;  M-x inf-ruby to connect irb,and it will provide REPL environment,
;;; it easy to send your code to the irb and can use M-x robe-start for
;;; code navigation and auto-complete.
;;;
;;;  If you want use syntax check or style check gem install rubocop or rubylint
;;; and enable flycheck mode.
;;;
;;;  If you are a rails develper,rinari package provide very useful functions to develop
;;; and can use M-x rinari-console work with robe to get code navigation and auto-complete,
;;; but you need add two gems pry and pry-doc to your Gemfile.

(require 'ruby-mode)

(global-rinari-mode t) ; For ruby on rails
(require 'yari) ; Yet Another RI interface

(dolist (file-pattern '("Rakefile\\'" "\\.rake\\'" "Gemfile\\'"))
  (add-to-list 'auto-mode-alist (cons file-pattern '(. ruby-mode))))

;; Let emacs find my local gem in my home.
(setenv "GEM_HOME" (expand-file-name "~/.gem"))

;; I bind it on evil-leader see setup-evil-leader.el file
(defun ruby-send-region-or-mystuff (start end)
  (interactive "r")
  (if mark-active
      (ruby-send-region start end)
    (ruby-send-mystuff)))
(defun ruby-send-current-line ()
  (interactive)
  (save-excursion
    (end-of-line)
    (let ((end (point)))
      (beginning-of-line)
      (ruby-send-region (point) end))))
(defun ruby-send-mystuff ()
  (interactive)
  (save-excursion
    (forward-paragraph)
    (ruby-beginning-of-block)
    (ruby-send-block)))
;; Bind on evil
(evil-define-motion evil-ruby-jump-item (count)
  :jump t
  :type inclusive
  (cond ((string-match ruby-block-beg-re (current-word))
         (ruby-end-of-block count))
        ((string-match ruby-block-end-re (current-word))
         (ruby-beginning-of-block count))
        (t
         (evil-jump-item count))))
(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key evil-normal-state-local-map (kbd "[[") 'ruby-beginning-of-block)
            (define-key evil-normal-state-local-map (kbd "]]") 'ruby-end-of-block)
            (define-key evil-motion-state-local-map (kbd "[[") 'ruby-beginning-of-block)
            (define-key evil-motion-state-local-map (kbd "]]") 'ruby-end-of-block)
            (define-key evil-normal-state-local-map "%" 'evil-ruby-jump-item)
            (define-key evil-motion-state-local-map "%" 'evil-ruby-jump-item)
            (define-key evil-motion-state-local-map "gd" 'robe-jump)))


(require 'ruby-electric)
(defun ruby-insert-end ()
  "Insert \"end\" at point and reindent current line."
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(require 'ruby-block)
(add-hook 'ruby-mode-hook 'ruby-block-mode)
(diminish 'ruby-block-mode)

(defun ruby-send-buffer ()
  (interactive)
  (save-excursion
    (ruby-send-region (point-min) (point-max))))

;; Use .irbrc and set default's :PROMPT_S => nil,
;; then it can work on my robe and correctly output prompt
;; depend on those gems pry pry-doc method-source
;; M-x inf-ruby
;; M-x robe-start
(require 'robe)
(eval-after-load 'company '(push 'company-robe company-backends))
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'inf-ruby-mode-hook 'robe-mode)

(provide 'setup-ruby-mode)
