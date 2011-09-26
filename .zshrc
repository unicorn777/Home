#!/usr/bin/env zsh  
## .myzshrc for zsh in /u/epitech_2011/rollan_a/cu
## 
## Made by alexis rolland
## Login   <rollan_a@epitech.net>
## 
## Started on  Tue May  6 09:27:12 2008 alexis rolland
## Last update Mon 26 Sep 2011 05:13:07 PM CEST unicorn
##

ulimit -c 0

# User s binaries
export PATH="$PATH:$HOME/mbin"
# Exalead binaries
export PATH="$PATH:/ng/sdk/tools/devenv/bin"
# Package s binaries
export PATH=$PATH:/usr/local/sbin:/usr/local/bin
# System s binaries
export PATH=$PATH:/usr/sbin:/usr/bin:/sbin:/bin
# Acrobat Reader
export PATH=$PATH:/opt/Adobe/Reader9/bin

export LANG="en_US.UTF-8"
export PAGER="less"
export EDITOR="vim"
export MAIL="/home/$USER/mail/$USER"
export WATCH="all"

# Je veux mes scollbar !
export LIBOVERLAY_SCROLLBAR=0

# History
  export HISTFILE=~/.zsh_history
  export HISTSIZE=5000
  export SAVEHIST=5000

# PROMPT
CL_NORMAL='%{[0m%}'
CL_RED='%{[0;31m%}'
CL_GOLD='%{[0;33m%}'
CL_CYAN='%{[0;36m%}'
B_CYAN='%{[1;36m%}'
B_GREY='%{[1;30m%}'
RPROMPT="[${CL_RED}%~${CL_NORMAL}]"
PROMPT="${CL_GOLD}%n${B_GREY}@${CL_GOLD}%m${CL_NORMAL}>%# "


export NORMAL='[0m'
export RED='[0;31m'

# Colorisation
if [ `uname` = "Linux" ]
  then
    alias ls="ls --color"
fi
if [ `uname` = "FreeBSD" ]
  then
    alias ls="ls -GF"
fi
if [ `uname` = "SunOS" ]
  then
    export PATH=$PATH:/usr/sfw/bin:/usr/site/school/bin:/usr/ccs/bin
fi

alias grep="grep --color --exclude-dir=.svn --exclude='*.swp'"
alias egrep="egrep --color --exclude-dir=.svn --exclude='*.swp'"
alias xxx="egrep -rn 'XXX|TODO|FIXME|//.*DEBUG' *"
alias l="ls -lh"
alias ll="l"
alias la="ls -lha"
alias emacs="emacs -nw"
alias ne="emacs"
alias e="emacs"
alias rdesk='rdesktop -a 24 -u unicorn -g 1670x970 81.56.47.78'

# Bindkey
  bindkey ""		beginning-of-line	# Ctrl+A
  bindkey ""		end-of-line		# Ctrl+E
  bindkey ""    transpose-chars
  # Home
    bindkey "\e[H"	beginning-of-line
    bindkey "[1~"	beginning-of-line
  # End
  bindkey "\e[F"	end-of-line
  bindkey "[4~"	end-of-line
  bindkey "[3~"	delete-char		# Delete

  bindkey "" history-incremental-search-backward # backward search in history
