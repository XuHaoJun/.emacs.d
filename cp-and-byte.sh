#!/bin/bash
cp -ruv . ~/.emacs.d 
emacs --batch --eval '(byte-recompile-directory "~/.emacs.d")' --kill 
