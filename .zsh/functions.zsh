#!/bin/sh
##
## .zsh_functions for Project in /home/unicorn/unixenv
##
## Made by unicorn
## Mail   <unicorn@exalead.com>
##
## Started on  Thu 13 Oct 2011 02:44:44 PM CEST unicorn
## Last update Tue 06 Mar 2012 12:18:03 PM CET arolland
##

function status() {
  if [ -d .svn ]; then
    colorsvn_status $@
  elif [ -d .git ]; then
    git status
  else
    echo "`pwd` is neither a git nor a svn working copy"
  fi
}

function search() {
  grep $1 `find . -name "*.$2"`
}

function isearch() {
  grep -i $1 `find . -name "*.$2"`
}

function psgrep() {
  ps aux | head -1 && ps aux | grep $1 | egrep -v "grep .* $1"
}
