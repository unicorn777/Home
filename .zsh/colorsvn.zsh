typeset -A svncolors
svncolors=(
  reset ${color[reset]}
  status_A ${color[Bgreen]}
  status_C ${bg[red]}
  status_D ${color[red]}
  status_M ${color[green]}
  status_X ${color[Bblack]}
  status_BANG ${color[Bred]}
  status_Q ${color[reset]}
  up_A ${color[Bgreen]}
  up_C ${bg[red]}
  up_D ${color[red]}
  up_E ${color[Bred]}
  up_G ${color[cyan]}
  up_U ${color[green]}
  diff_current ${color[green]}
  diff_last ${color[red]}
  log_user ${color[Bgreen]}
  log_merged_user ${color[green]}
)

function colorsvn_status() {
  svn status $@\
    | sed -u "s/\(^A.*\)/${svncolors[status_A]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^C.*\)/${svncolors[status_C]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^D.*\)/${svncolors[status_D]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^M.*\)/${svncolors[status_M]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^X.*\)/${svncolors[status_X]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^!.*\)/${svncolors[status_BANG]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^?.*\)/${svncolors[status_Q]}\1${svncolors[reset]}/"
}

function colorsvn_diff() {
  svn diff $@\
    | sed -u "s/\(^-.*\)/${svncolors[diff_last]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^\+.*\)/${svncolors[diff_current]}\1${svncolors[reset]}/"\
    | sed -u "s/@@ \(-[0-9]\+,[0-9]\+\) \(\+[0-9]\+,[0-9]\+\) @@/@@ ${svncolors[diff_last]}\1${svncolors[reset]} ${svncolors[diff_current]}\2${svncolors[reset]} @@/"
}

function colorsvn_up_co() {
  if [ $EDITOR ]; then
    GVIM=`which gvim`
    CEDITOR=$EDITOR
    if [ $EDITOR = "vim" -o $EDITOR = "vi" -a -x $GVIM ]; then
      export EDITOR=$GVIM
    fi
  fi
  UpOrCo=$1
  shift
  svn $UpOrCo $@\
    | sed -u "s/\(^A \+.*\)/${svncolors[up_A]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^C \+.*\)/${svncolors[up_C]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^D \+.*\)/${svncolors[up_D]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^E \+.*\)/${svncolors[up_E]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^G \+.*\)/${svncolors[up_G]}\1${svncolors[reset]}/"\
    | sed -u "s/\(^ *U\+ \+.*\)/${svncolors[up_U]}\1${svncolors[reset]}/"
  if [ $EDITOR ]; then
    export EDITOR=$CEDITOR
  fi

}

function colorsvn_up() {
  colorsvn_up_co "up" $@
}
function colorsvn_co() {
  colorsvn_up_co "co" $@
}

function colorsvn_log() {
  svn log $@\
    | sed "s/\(^r[0-9]\+ | \)$USER/\1${svncolors[log_user]}${USER}${svncolors[reset]}/"\
    | sed "s/\(^ \+r[0-9]\+ | \)$USER/\1${svncolors[log_merged_user]}${USER}${svncolors[reset]}/"
}
