(require 'tex-site)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq-default TeX-master nil)

;; choice other soft open it.
(setq TeX-view-program-list
      '(("pxdvi" "pxdvi -watchfile 1 %d")
        ("TeXworks" "texworks %o")
        ("fwdevince" "fwdevince %o %n \"%b\"")
        ("Okular" "okular --unique \"file:%o#src:%n `pwd`/%b\"")
        ("zathura" "zathura -s -x \"emacsclient --no-wait +%%{line} %%{input}\" %o")
        ("qpdfview" "qpdfview --unique \"%o#src:%b:%n:0\"")
        ("PdfViewer" "pdfviewer \"file:%o#src:%n %b\"")
        ("acroread" "acroread %o")
        ("pdfopen" "pdfopen -viewer ar9-tab %o")))
(setq TeX-view-program-selection '((output-dvi "pxdvi")
                                   (output-pdf "zathura")))

;; pdf preview setup
(setq preview-image-type 'dvipng)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-source-correlate-start-server t)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)

(add-hook 'LaTeX-mode-hook 'smartparens-mode)

(provide 'setup-tex)
