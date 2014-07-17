##
## exalead.zsh for Zsh config
##
## Made by Alexis Rolland
## Mail   <alexis.rolland@exalead.com>
##
## Started on  Thu 13 Oct 2011 02:50:16 PM CEST arolland
## Last update Tue 06 Mar 2012 12:42:51 PM CET arolland
##

source /ng/sdk/tools/devenv/zsh/exalead.zsh
fpath+=(/ng/sdk/tools/devenv/zsh/completions)

if [[ -z "$skip_global_compinit" ]]; then
  autoload -Uz compinit
  compinit -i -d $HOME/.zcache
fi

export NG_HAXXOR="L33T"
export CVLICENSE="/ng/src/$USER/cvlicense.dat"
export ADMINUIDEV="DEVMODE"

# Exalead binaries
export PATH="$PATH:/ng/sdk/tools/devenv/bin"
# Acrobat Reader
export PATH=$PATH:/opt/Adobe/Reader9/bin


PROMPT="%{${color[yellow]}%}%n%{${color[Bblack]}%}@%{${color[cyan]}%}%m%{${color[reset]}%}>%# "

###########
# Aliases #
###########
alias edk="cd ~/svn/edk/edk/trunk"
alias cv="cd ~/svn/mercury/cloudview/trunk"
alias c="cd ~/svn/platform/cloudview-core/trunk"
alias windows="rdesktop -k en-us -u arolland -g 1650x970 madpc108"
alias winbuilder="rdesktop -k en-us -d OFFICE -u ng-build -g 90% tcdev007"
alias builder="ssh ng-build@reddev004"
alias applyconf="cvcommand :10011 /command applyConfig"
alias sdk="make SDK | sed 's/.*error.*/${color[red]}\0${color[reset]}/' | sed 's/.*successful.*/${color[green]}\0${color[reset]}/'"
alias cds="source ~/.mbin/cds"
