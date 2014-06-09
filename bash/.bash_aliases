alias c='clear; ls'

# directories
alias home='cd ~/'
alias workspace='cd ~/workspace/'
alias remote='cd ~/remoteserv/'
alias appstore='cd ~/workspace/famigo/web/AppStore/'

# grep
alias cgrep='grep --color=always'
alias pygrep='grep --include=*.py --exclude=*.pyc'
alias jgrep='grep --include*.java --exclude=*.class'

# SSH and SSHFS
function ssh-cs() { ssh aw4sythe@$@.cs.utexas.edu; }
function sshfs-cs() { sshfs aw4sythe@$@.cs.utexas.edu:. /home/alex/remoteserv/ -p 22; }
export -f ssh-cs
export -f sshfs-cs

alias ssh-babybrain='ssh alex@99.67.238.122'
alias sshfs-babybrain='sshfs alex@99.67.238.122:$HOME /home/alex/remoteserv/ -p 22'
alias ssh-raum='ssh aw4sythe@raum.cs.utexas.edu'
alias sshfs-raum='sshfs aw4sythe@raum.cs.utexas.edu:. /home/alex/remoteserv/ -p 22'
alias unmount='fusermount -u ~/remoteserv/'

# Git
function git_push_current_branch() {
BRANCH=`git branch | grep \* | awk '{print $2}'`
git push fork $BRANCH
}

# Other alias files

