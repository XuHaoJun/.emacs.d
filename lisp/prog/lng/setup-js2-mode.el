(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-global-externs
   '("module" "require" "buster" "sinon" "assert" "refute" "exports"
     "setTimeout" "clearTimeout" "setInterval" "clearInterval"
     "location" "__dirname" "console" "JSON")))

(require 'company-tern)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-tern))

(defun setup-js2-mode-hook ()
  (smartparens-mode t))

(add-hook 'js2-mode-hook 'setup-js2-mode-hook)

(custom-set-faces
 '(js2-external-variable ((t (:foreground "IndianRed2")))))

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(provide 'setup-js2-mode)
