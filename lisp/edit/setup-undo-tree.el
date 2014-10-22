;放到load-path中，配置文件中添加
(require 'undo-tree)
(global-undo-tree-mode)
;; C-x u 进入 undo-tree-visualizer-mode , p n 上下移动，在分支之前 b f
;; 左右切换，t 显示时间戳，选定需要的状态后， q 退出。这是主要的操作，
;; 其它的自己摸索好了……

(provide 'setup-undo-tree)
