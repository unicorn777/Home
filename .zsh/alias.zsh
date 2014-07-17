alias st="status"
alias svndiff="colorsvn_diff"
alias up="colorsvn_up"
alias svnlog="colorsvn_log | less -R"
alias grep="grep --color --exclude-dir=.svn --exclude='*.swp'"
alias egrep="egrep --color --exclude-dir=.svn --exclude='*.swp'"
alias xxx="egrep -rn 'XXX|TODO|FIXME|//.*DEBUG' *"
alias emacs="emacs -nw"
alias ne="emacs"
alias e="emacs"
alias rdesk='rdesktop -a 24 -u unicorn -g 1670x970 unicorn.homeunix.com'
alias wakeasterix='wakeonlan -i unicorn.homeunix.com -p 3389 C8:60:00:C3:0B:8F'

# ls customization
alias l="ls -lh"
alias ll="l"
alias la="ls -lha"
if [ `uname` = "Linux" ]
  then
    alias ls="ls --color"
fi
if [ `uname` = "FreeBSD" ]
  then
    alias ls="ls -GF"
fi

