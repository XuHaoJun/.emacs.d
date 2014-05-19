#!/bin/sh

function die() {
    echo "${@}"
    exit 1
}

enter_path=`pwd`
git clone https://github.com/XuHaoJun/emacs.d || die "git clone failed"

cd ./emacs.d
rake || die "Rake failed"

cd $enter_path
