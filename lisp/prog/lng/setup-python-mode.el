;;; Require package: (anaconda-mode)

;; need install jedi and epc from pip
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc)

(defun only-use-anaconda ()
  (add-to-list 'company-backends 'company-anaconda)
  (setq company-backends
        (delete 'company-ropemacs company-backends)))

(eval-after-load 'company
  '(only-use-anaconda))

;; Syntax check by flycheck-mode depend extern flake8 or pylint.
;; (add-hook 'python-mode-hook 'flycheck-mode)

(provide 'setup-python-mode)
