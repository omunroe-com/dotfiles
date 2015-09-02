# ***THIS IS NOT A SCRIPT***
# todo: make this a script

# 1. connect to LAN or WiFi
# 2. curl this script from github
# 3. run the script with sudo


###############
### apt-get ###
###############

### add repositories
declare -a repos=(
	'djcj/screenfetch'
	'linrunner/tlp'
	'webupd8team/sublime-text-3'
	'webupd8team/y-ppa-manager'
)

for repo in "${repos[@]}"; do
	add-apt-repository ppa:$repo
done

### install packages
declare -a packages=(
	'curl'
	'diodon'
	'gimp'
	'git'
	'gparted'
	'guake'
	'indicator-multiload'
	'meld'
	'mypaint'
	'nautilus-compare'
	'nautilus-dropbox'
	'openjdk-7-jdk'
	'openjdk-8-jdk'
	'p7zip-full'
	'synaptic'
	'tmux'
	'ubuntu-restricted-extras'
	'unity-tweak-tool'
	'vim'
	'vlc'
	'xclip'
	# 'ack'
	# 'compizconfig-settings-manager'
	# 'tomboy'
	# 'virtualbox'
	# 'virtualbox-guest-additions-iso'

	# third-party
	'screenfetch'
	'sublime-text-installer'
	'tlp'
	'tlp-rdw'
	'y-ppa-manager'
)

apt-get update

for package in "${packages[@]}"; do
	apt-get install $package
done


###########
### pip ###
###########

### install pip
cd $HOME/Downloads
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py

### install pip packages
declare -a pip_packages=(
	'requests'
	'virtualenv'
	'virtualenvwrapper'
	# 'awscli'
)

for package in "${pip_packages[@]}"; do
	pip install $package
done


#####################
### configuration ###
#####################

### TODO: setup ssh keys
# https://help.github.com/articles/generating-ssh-keys/
ssh_key=$HOME/.ssh/id_rsa.pub
if [ ! -f $ssh_key ]; then
	ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
fi
eval "$(ssh-agent -s)"
ssh-add $ssh_key
xclip -sel clip < $ssh_key

# attempt to ssh to github
ssh -T git@github.com

### TODO: add applications to auto start

### add bookmarks
if [ -f $HOME/alex/Dropbox ]; then
	echo file:///home/alex/Dropbox >> $HOME/.config/gtk-3.0/bookmarks
fi

mkdir $HOME/workspace
echo file:///home/alex/workspace >> $HOME/.config/gtk-3.0/bookmarks

### disable bluetooth on startup
sudo echo rfkill block bluetooth >> /etc/rc.local


##############
### manual ###
##############

# configure ubuntu settings (power, display, etc.)

### guake config:
# run as login shell
# add to startup apps
# adjust transparency
# disable popup on startup
# open new tab in current directory
# add to startup applications

# enable natural scrolling
# start indicator multiload and add memory to display
# start diodon
# change wallpaper
# tweak unity

## TODO: install google chrome
# install chrome .deb
# sign into chrome
# configure chrome to use system titlebar and borders
# sign into dropbox

### TODO: install ultimate vimrc:
# git clone git://github.com/amix/vimrc.git $HOME/.vim_runtime
# $HOME/.vim_runtime/install_basic_vimrc.sh

# set "run command as login shell" in terminals for RVM

# TODO: install intellij

# TODO: install android studio

# TODO: install pycharm
# http://www.jetbrains.com/pycharm/download/

# TODO: setup heroku
# https://toolbelt.heroku.com/debian
# wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
# heroku accounts
# heroku plugins:install git://github.com/ddollar/heroku-accounts.git

# TODO: set up zsh & prezto
# https://github.com/sorin-ionescu/prezto.git

# TODO: set up shell color theme
# https://github.com/chriskempson/base16-shell

# TODO: set up vim color theme
# https://github.com/chriskempson/base16-vim

# TODO: set up dotfiles
# git@github.com:alexwforsythe/dotfiles

# TODO: set up notifyosd.zsh
# git@github.com:ihashacks/notifyosd.zsh.git

### install sublime text 2 plugins
# https://sublime.wbond.net/installation#st2
# sublimecodeintel
# base16 themes

# manually set color theme for gnome-terminal and guake

# to upgrade to non-lts versions automatically,
# manually update /etc/update-manager/release-upgrades:
# Prompt=normal
