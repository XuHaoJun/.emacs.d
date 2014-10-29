#!/usr/bin/emacs --script

(add-to-list 'load-path "lisp/")

(load "setup-package.el")
(load "auto-install-packages.el")

(require 'setup-package)
(require 'auto-install-packages)

(package-refresh-contents)

(auto-install-packages)

(package-list-packages-no-fetch)

(package-menu-mark-upgrades)

(defadvice package-menu-execute (around stfu activate)
  (flet ((yes-or-no-p (&rest args) t)
         (y-or-n-p (&rest args) t))
    ad-do-it))

(package-menu-execute)
