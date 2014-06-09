#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_DIR="$DIR/backup"


install_dotfiles () {
  for src in $(find $DIR -mindepth 2 -maxdepth 2 \
      -not -path "$BACKUP_DIR)/*" -not -path "$DIR/.*")
  do
    dst="$HOME/$(basename $src)"
    link_item "$src" "$dst"
  done
}

# Link a file or directory to the home directory.
link_item () {
  local src=$1 dst=$2
  skip=false

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ] ; then
    local cur_src="$(readlink $dst)"

    if [ "$cur_src" == "$src" ] ; then
      echo "$src: Link already exists, skipping."
      skip=true
    else
      echo -n "$src: Already exists, backing up ... "
      mv $dst $BACKUP_DIR
      echo "done"
    fi
  fi

  if [ "$skip" == "false" ] ; then
    # Create a symlink
    echo -n "Linking $src ... "
    ln -s "$src" "$HOME"
    echo "done"
  fi
}

# Create backup directory
if [ ! -d $BACKUP_DIR ] ; then
  echo -n "Creating backup directory at $BACKUP_DIR for existing dotfiles ... "
  mkdir $BACKUP_DIR
  echo "done"
fi

# Change to dotfiles directory
echo -n "Changing to $DIR directory ... "
cd $DIR
echo "done"

# Install the dotfiles
echo "Installing dotfiles ... "
echo ""
install_dotfiles
echo ""
echo "Installation complete."

