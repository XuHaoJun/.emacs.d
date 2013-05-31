(require 'tooltip)

;; author: pluskid
;; 调用 stardict 的命令行接口来查辞典
;; 如果选中了 region 就查询 region 的内容，
;; 否则就查询当前光标所在的词
(global-set-key (kbd "C-c d") 'kid-star-dict)
(defun kid-star-dict ()
  (interactive)
  (let ((word
         (if mark-active
             (buffer-substring-no-properties
              (region-beginning) (region-end))
           (current-word nil t))))
    ;; 有时候 stardict 会很慢，所以在回显区显示一点东西
    ;; 以免觉得 Emacs 在干什么其他奇怪的事情。
    (message "searching for %s ..." word)
    (tooltip-show
     (shell-command-to-string
      (concat "sdcv -n " word)))))

(provide 'setup-stardict)
