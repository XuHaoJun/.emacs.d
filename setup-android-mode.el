(require 'android-mode)

(defun android-ant-my ()
  (interactive)
  (android-ant "debug && ant installd"))

(provide 'setup-android-mode)
