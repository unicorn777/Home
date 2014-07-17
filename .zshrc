#!/usr/bin/env zsh  
## .myzshrc for zsh in /u/epitech_2011/rollan_a/cu
## 
## Made by alexis rolland
## Login   <rollan_a@epitech.net>
## 
## Started on  Tue May  6 09:27:12 2008 alexis rolland
## Last update Tue 06 Mar 2012 02:49:47 PM CET arolland
##

#
# /!\ Please only put generic zsh configuration here.
#

ulimit -c 0

# Package s binaries
export PATH=$PATH:/usr/local/sbin:/usr/local/bin
# System s binaries
export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
# User s binaries
if [ -d $HOME/.mbin ]; then
  export PATH=$PATH:$HOME/.mbin
fi

export LANG="en_US.UTF-8"
export PAGER="less"
export EDITOR="vim"
export MAIL="$HOME/mail/$USER"
export WATCH="all"

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000

if [ `uname` = "SunOS" ]; then
    export PATH=$PATH:/usr/sfw/bin:/usr/site/school/bin:/usr/ccs/bin
fi

if [ -d $HOME/.zsh ]; then
  if [ -f $HOME/.zsh/alias.zsh ];then
    source $HOME/.zsh/alias.zsh
  fi
  if [ -f $HOME/.zsh/colors.zsh ];then
    source $HOME/.zsh/colors.zsh
  fi
  if [ -f $HOME/.zsh/colorsvn.zsh ];then
    source $HOME/.zsh/colorsvn.zsh
  fi
  if [ -f $HOME/.zsh/functions.zsh ];then
    source $HOME/.zsh/functions.zsh
  fi
  if [ -f $HOME/.zsh/bindkeys.zsh ];then
    source $HOME/.zsh/bindkeys.zsh
  fi
fi

# PROMPT
RPROMPT="[%{${color[red]}%}%~%{${color[reset]}%}][%{${color[red]}%}%T%{${color[reset]}%}]"
PROMPT="%{${color[yellow]}%}%n%{${color[Bblack]}%}@%{${color[yellow]}%}%m%{${color[reset]}%}>%# "

# This one must be sourced at the very end to be able to override parameters
if [ -f $HOME/.zsh/zshrc_custom ]; then
  source $HOME/.zsh/zshrc_custom
fi
