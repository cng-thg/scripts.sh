#!/bin/sh

# ---------------------------------------------------------------------------
#
# dotfiles.sh   : Link dotfiles in a folder to $HOME
#
# Usage       : chmod +x ./dotfiles.sh && ./dotfiles.sh
#
# Site        : github.com/cng-thg/scripts.sh
# Author      : Thiago Cangussu <cng.thg@gmail.com>
# Maintainer  : Thiago Cangussu <cng.thg@gmail.com>
# Date        : 20141216
# License     : BSD
#
# ---------------------------------------------------------------------------

# Your code here

# Variables
DOTFILES=$HOME/.dotfiles
DOTFILES_LIST=dotfiles
DOTFILES_LIST_PATH=${DOTFILES}/${DOTFILES_LIST}

HELP_MESSAGE="
Usage: $(basename "$0") [-h | -c | -l]

  -h, --help      Show help message.
  -c, --config    Check if dotfiles folder and dotfiles list exists.
                  If not, it will create them.
  -l, --link      Create symbolic link for files in dotfiles list.
  -a, --add       Add files to dotfiles folder and creates symbolic link.
"


# Check if directory exists
check_dotfiles_dir() {
  if [ ! -d ${DOTFILES} ]
  then
    echo "${DOTFILES} does not exists. Creating it."
    mkdir ${DOTFILES}
  fi
}


# Check if dotfiles list exists
check_dotfiles_list() {
  if [ ! -e ${DOTFILES_LIST_PATH} ]
  then
    echo "Dotfiles list does not exists. Creating it."
    check_dotfiles_dir
    touch ${DOTFILES_LIST_PATH}
  else
    echo "Dotfiles list already exists. Done."
  fi
}


check_files() {
  if [ -e $1 ] || [ -L $1 ]
  then
    if [ -L $1 ]
    then
      echo "File $1 exists and is a link."
      return 2
    elif [ -f $1 ]
    then
      echo "File $1 exists and is a normal file."
      return 0
    else
      echo "File $1 exists and is unknown type."
      return 3
    fi
  else
    echo "File $1 does not exists."
    return 1
  fi
}


# Backup files
backup_files() {
  echo "Backing up file $1."
  mv $1 $1.bkp
  echo "Done."
}

# Create links
create_links() {
  echo "Creating link."
  ln -s $1 $2
}

# Link files
link_dotfiles() {
  cat $1 | while read LINE;
  do
    check_files $HOME/.$LINE
    if [ $? -eq 0 ]
    then
      backup_files $HOME/.$LINE
      echo "Creating link."
      ln -s ${DOTFILES}/$LINE $HOME/.$LINE
    elif [ $? -eq 1 ]
    then
      echo "Creating link."
      ln -s ${DOTFILES}/$LINE $HOME/.$LINE
    else
      echo "File is already in place. Done."
    fi
  done
}

# Move and rename files
mv_files() {
  mv $1 ${DOTFILES}/$(echo ${1} | cut -d '.' -f 2)
}

# Add files and links
add_files() {
  mv_files $1
  create_links ${DOTFILES}/$(echo ${1} | cut -d '.' -f 2) $1
}


# Program options
case "$1" in

  -h | --help)
    echo "${HELP_MESSAGE}"
    exit 0
  ;;

  -c | --config)
    check_dotfiles_list
  ;;

  -l | --link)
    link_dotfiles ${DOTFILES_LIST_PATH}
  ;;  

  -a | --add)
    add_files $2
  ;;

  *)
    echo "${HELP_MESSAGE}"
esac
