alias c='clear; ls'

# directories
alias home='cd ~/'
alias work='cd ~/workspace/'
alias remote='cd ~/remoteserv/'

# grep
alias cgrep='grep --color=always'
alias pygrep='grep --include=*.py --exclude=*.pyc'
alias jgrep='grep --include=*.java --exclude=*.class'

# SSH and SSHFS
function ssh-cs() { ssh aw4sythe@$@.cs.utexas.edu; }
function sshfs-cs() { sshfs aw4sythe@$@.cs.utexas.edu:. /home/alex/remoteserv/ -p 22; }

alias unmount='fusermount -u ~/remoteserv/'

# Git
function git_push_current_branch() {
BRANCH=`git branch | grep \* | awk '{print $2}'`
git push fork $BRANCH
}

# Other alias files

