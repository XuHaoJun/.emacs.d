;;;  Require package:
;;; (robe yari ruby-electric ruby-block inf-ruby evil auto-complete rinari)
;;; Useage:
;;;  M-x inf-ruby to connect irb,and it will provide REPL environment,
;;; it easy to send your code to the irb and can use M-x robe-start for
;;; code navigation and auto-complete.
;;;
;;;  If you want use syntax check or style check gem install rubocop
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
            (define-key evil-motion-state-local-map (kbd "]]") 'ruby-end-of-block)
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


(require 'inf-ruby)
(setq inf-ruby-implementations
      (delq (assoc "ruby" inf-ruby-implementations) inf-ruby-implementations))
(add-to-list 'inf-ruby-implementations '("ruby"     . "irbb --inf-ruby-mode -r irb/completion"))
(add-hook 'inf-ruby-mode-hook (lambda () (setq evil-auto-indent nil)))
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(require 'ac-inf-ruby) ;; when not installed via package.el
(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'inf-ruby-mode))
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
(defun ruby-send-buffer ()
  (interactive)
  (save-excursion
    (ruby-send-region (point-min) (point-max))))


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
