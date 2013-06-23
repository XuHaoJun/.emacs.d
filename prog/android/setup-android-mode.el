(require 'android-mode)

(custom-set-variables
 '(android-mode-sdk-dir "/opt/android-sdk"))

;; it like ant debug && ant installd && adb shell am start ....
(defun android-ant-my ()
  (interactive)
  (let* ((package (android-project-package))
         (current (android-current-buffer-class-name))
         (activity (if (member current
                               (android-project-main-activities))
                       current
                     (car (android-project-main-activities "LAUNCHER"))))
         (command (concat (android-tool-path "adb")
                          " shell am start -n "
                          (concat package "/" activity))))
    (android-ant (concat "debug && ant installd && "
                         command))))

(define-key android-mode-map
  (read-kbd-macro (concat android-mode-key-prefix " " "m"))
  'android-ant-my)

(provide 'setup-android-mode)
