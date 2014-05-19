#!/usr/bin/emacs --script

(load-path "../setup-package.el")
(load-path "../auto-install-packages.el")

(require 'setup-package)
(require 'auto-install-packages)

(package-refresh-contents)
(auto-install-packages)
