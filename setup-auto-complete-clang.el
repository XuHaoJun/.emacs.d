(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)
;; 添加c-mode和c++-mode的hook，开启auto-complete的clang扩展  
(defun wttr/ac-cc-mode-setup ()  
  ;; (make-local-variable 'ac-auto-start)  
  ;; (setq ac-auto-start nil)              ;auto complete using clang is CPU sensitive  
  (setq ac-sources (append '(ac-source-clang) ac-sources)))  
(add-hook 'c-mode-hook 'wttr/ac-cc-mode-setup)  
(add-hook 'c++-mode-hook 'wttr/ac-cc-mode-setup)  

;;You can find the /usr/XXX paths from the messages outputted by the command.
;; echo "" | g++ -v -x c++ -E -
(setq ac-clang-flags
      (mapcar(lambda (item)(concat "-I" item))
             (split-string
              "
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2/x86_64-unknown-linux-gnu
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/../../../../include/c++/4.7.2/backward
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include
 /usr/local/include
 /usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.2/include-fixed
 /usr/include/SDL/SDL.h
 /usr/include
")))

(provide 'setup-auto-complete-clang)
