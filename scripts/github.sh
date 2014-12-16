#!/bin/sh

# ---------------------------------------------------------------------------
#
# github.sh   : Pull github repositories from text file
#
# Usage       : chmod +x ./github.sh && ./github.sh
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
LOCAL_REPO_PATH=${HOME}/Repo/${USER}
GITHUB_USER=cng-thg
REMOTE_REPO_LIST=github_repositories
REMOTE_REPO_LIST_PATH=${LOCAL_REPO_PATH}/${REMOTE_REPO_LIST}

# Keys
LOCAL_REPO=0
REPO_LIST=0
GIT_BIN=0

# Check if repository path exists
if [ -d ${LOCAL_REPO_PATH} ]
then
  LOCAL_REPO=1
  echo "Repository path ${LOCAL_REPO_PATH} exists."
else
  mkdir $LOCAL_REPO_PATH
  echo "Repository path does not exists. Creating it."
fi

# Check if repository list exists
if [ -f ${REMOTE_REPO_LIST_PATH} ]
then
  REPO_LIST=1
  echo "Repository list ${REMOTE_REPO_LIST_PATH} exists."
else
  echo "Repository list ${REMOTE_REPO_LIST_PATH} \
  does not exists. Creating one."
  touch ${REMOTE_REPO_LIST_PATH}
fi

# Check if git binary is installed
if [ $which git ]
then
  GIT_BIN=1
  echo "Git binary found."
else
  echo "Git binary not found. Installing git."
  sudo apt-get install git
fi

# Check if repository list has something
if [ ${REPO_LIST} -eq 1 ]
then
  cat ${REMOTE_REPO_LIST_PATH} | while read LINE;
  do
    #Check if repository is already pulled.
    if [ -d ${LOCAL_REPO_PATH}/${LINE} ]
    then
      echo "Repository ${LINE} exists."
    else
      if [ ${GIT_BIN} -eq 1 ]
      then
        git clone git@github.com:${GITHUB_USER}/${LINE}.git \
        ${LOCAL_REPO_PATH}/${LINE}
      fi
    fi
  done
fi
