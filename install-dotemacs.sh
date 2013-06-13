#!/bin/zsh

# Global var
dotemacs_dir="$HOME/.emacs.d"
base_pwd=`pwd`


# Util function
function warn ()
{
    echo "$1" >&2
}

function die ()
{
    warn "$1"
    exit 1
}


# Important function
function check_dotemacs ()
{
    if [ -e $HOME/{.emacs,.emacs.d} ];then
        die "Faild, because have .emacs.d or .emacs on your home path"
    fi
}


function update_self ()
{
    git pull
    git submodule update --init
}


function creat_dotemacs ()
{
    mkdir $dotemacs_dir
    find .var -type d -exec mkdir -p $dotemacs_dir/{} \;
}


function install_dotemacs ()
{
    creat_dotemacs

    ln -s $base_pwd/*.el $dotemacs_dir
    ln -s $base_pwd/*(/) $dotemacs_dir
}


function main ()
{
    check_dotemacs

    update_self

    install_dotemacs
}

main
