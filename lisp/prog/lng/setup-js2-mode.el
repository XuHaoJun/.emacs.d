(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(setq ac-js2-evaluate-calls t)

(custom-set-variables
 '(js2-basic-offset 2))

(require 'company-tern)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-tern))

(defun setup-js2-mode-hook ()
  (smartparens-mode t))

(add-hook 'js2-mode-hook 'setup-js2-mode-hook)

;; To add completions for external libraries add something like this:
;;
;; (add-to-list 'ac-js2-external-libraries "path/to/lib/library.js")

(custom-set-variables
 '(js2-external-variable ((t (:foreground "LightSalmon1")))))

(custom-set-faces
 '(js2-external-variable ((t (:foreground "IndianRed2")))))

(provide 'setup-js2-mode)
