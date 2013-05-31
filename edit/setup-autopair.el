(require 'autopair)

(add-hook 'c-mode-common-hook 
          #'(lambda () (autopair-mode)))

(provide 'setup-autopair)
