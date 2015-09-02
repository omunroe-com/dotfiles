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

echo $repos
read -p 'add proprietary repositories? [Y/n] ' -r
if [[ $reply =~ [yY](es)? ]] ; then
	for repo in "${repos[@]}"; do
		add-apt-repository ppa:$repo
	done
fi

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
	'vagrant'
	'vim'
	'virtualbox'
	'virtualbox-guest-additions-iso'
	'vlc'
	'xclip'
	# 'ack'
	# 'compizconfig-settings-manager'
	# 'tomboy'

	# third-party
	'screenfetch'
	'sublime-text-installer'
	'tlp'
	'tlp-rdw'
	'y-ppa-manager'
)

echo $packages
read -p 'install canonical packages? [Y/n] ' -r
if [[ $reply =~ [yY](es)? ]] ; then
	apt-get update
	for package in "${packages[@]}"; do
		apt-get install $package
	done
fi


###########
### pip ###
###########

### install pip
read -p -n 'install pip? [Y/n] ' -r
if [[ $reply =~ [yY](es)? ]] ; then
	echo
	wget https://bootstrap.pypa.io/get-pip.py > python
else
	echo 'skipped'
fi

### install pip packages
declare -a pip_packages=(
	'requests'
	'virtualenv'
	'virtualenvwrapper'
	# 'awscli'
)

echo $pip_packages
read -p 'install pip packages? [Y/n] ' -r
if [[ $reply =~ [yY](es)? ]] ; then
	for package in "${pip_packages[@]}"; do
		pip install $package
	done
fi


#####################
### configuration ###
#####################

### ssh keys ###
# https://help.github.com/articles/generating-ssh-keys/
ssh_key=$HOME/.ssh/id_rsa.pub
if [ ! -f $ssh_key ]; then
	read -p 'generate ssh key? [Y/n] ' -r
	if [[ $reply =~ [yY](es)? ]] ; then
		read -p 'enter your email address: ' -r
		# todo: test email address
		ssh-keygen -t rsa -b 4096 -C $reply
		eval "$(ssh-agent -s)"
		ssh-add $ssh_key
	fi
fi

read -p 'copy ssh key to clipboard? [Y/n] ' -r
if [[ $reply =~ [yY](es)? ]] ; then
	if hash xclip 2>/dev/null; then
		xclip -sel clip < $ssh_key
		echo 'copied'
		read -p 'press any key to continue ...'
	else
		echo -n 'unable to copy ssh key, '
		if [ -f $ssh_key]; then
			read -p 'print instead? [Y/n] ' -r
			if [[ $reply =~ [yY](es)? ]] ; then
				cat $ssh_key
				read -p 'press any key to continue ...'
			fi
		else
			echo 'skipping'
			read -p 'press any key to continue ...'
		fi
	fi
fi

read -p 'test connection to github? [Y/n] ' -r
if [[ $reply =~ [yY](es)? ]] ; then
	ssh -T git@github.com
fi

### TODO: add applications to auto start

### add bookmarks
declare -a bookmarks=(
	'workspace',
	'Dropbox'
)

bookmarks_file=$HOME/.config/gtk-3.0/bookmarks
if [ -f $bookmarks_file ]; do
	for bookmark in "${bookmarks[@]}"; do
		if [ -d $bookmark ]; do
			read -p -n "Add $bookmark to bookmarks? [Y/n] " -r
			if [[ $reply =~ [yY](es)? ]] ; then
				echo file://$HOME/$bookmark >> $bookmarks_file
				echo 'done'
			else
			  echo 'skipped'
			fi
		fi
	done
fi

# disable bluetooth on startup?

### disable bluetooth on startup
# echo rfkill block bluetooth >> /etc/rc.local
read -p -n "Disable bluetooth on startup? [Y/n] " -r
if [[ $reply =~ [yY](es)? ]] ; then
	disable_str="# Disable bluetooth on startup\nrfkill block bluetooth\n"
	sed -i "/exit 0/i$disable_str" /etc/rc.local
	echo 'done'
else
  echo 'skipped'
fi

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
