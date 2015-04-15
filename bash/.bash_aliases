alias c="clear ; ls"

# directories
alias home="cd $HOME"
alias work="cd $HOME/workspace/"

# grep
alias cgrep="grep --color=always"
alias pygrep="grep --include=*.py"
alias jgrep="grep --include=*.java"
alias jsgrep="grep --include=*.js"

# Git
function git_push_current_branch() {
  branch=`git branch | grep \* | awk '{print $2}'`
  git push fork $branch
}

# Other alias files

