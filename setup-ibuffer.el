(require 'ibuffer)
;; inovke ibuffer
(setq ibuffer-shrink-to-minimum-size t)
(setq ibuffer-always-show-last-buffer nil)
(setq ibuffer-sorting-mode 'recency)
(setq ibuffer-use-header-line t)
(define-key global-map "\C-x\C-b" 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(provide 'setup-ibuffer)
