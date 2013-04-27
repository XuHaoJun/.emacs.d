(setq newsticker-url-list-defaults nil)
(setq newsticker-html-renderer 'w3m-region)
(setq newsticker-automatically-mark-items-as-old t)
(setq newsticker-automatically-mark-visited-items-as-old t)
(setq newsticker-retrieval-interval 600)
(setq newsticker-retrieval-method 'extern)
(setq newsticker-url-list '(("IBM devel Linux" "http://www.ibm.com/developerworks/views/linux/rss/libraryview.jsp")))

(provide 'setup-newsticker)
