#!/usr/bin/emacs --script

(add-to-list 'load-path ".")

(load "setup-package.el")
(load "auto-install-packages.el")

(require 'setup-package)
(require 'auto-install-packages)

(package-refresh-contents)
(auto-install-packages)
