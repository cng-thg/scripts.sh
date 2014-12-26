#!/bin/sh

# ---------------------------------------------------------------------------
#
# docker.sh   : Install docker from official repository
#
# Usage       : chmod +x ./docker.sh && ./docker.sh
#
# Site        : github.com/cng-thg/scripts.sh
# Author      : Thiago Cangussu <cng.thg@gmail.com>
# Maintainer  : Thiago Cangussu <cng.thg@gmail.com>
# Date        : 20141204
# License     : BSD
#
# ---------------------------------------------------------------------------

# Check that HTTPS transport is available to APT
if [ ! -e /usr/lib/apt/methods/https ]; then
  sudo apt-get update && sudo apt-get install -y apt-transport-https
fi

# Add the repository to your APT sources
echo deb https://get.docker.com/ubuntu docker main | \
sudo tee /etc/apt/sources.list.d/docker.list

# Then import the repository key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys \
                             36A1D7869245C8950F966E92D8576A8BA88D21E9

# Install docker
sudo apt-get update && sudo apt-get install -y lxc-docker
