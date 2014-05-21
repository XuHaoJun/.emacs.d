#!/bin/sh

function die() {
    echo "${@}"
    exit 1
}

# (save-excursion
enter_path=`pwd`
git clone https://github.com/XuHaoJun/emacs.d || die "Git clone failed"
cd ./emacs.d
rake || die "Rake failed"
cd $enter_path
# )
