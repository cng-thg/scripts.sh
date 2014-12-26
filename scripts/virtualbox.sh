#!/bin/sh

# ---------------------------------------------------------------------------
#
# virtualbox.sh   : Install virtualbox from official repository
#
# Usage       : chmod +x ./virtualbox.sh && ./virtualbox.sh
#
# Site        : github.com/cng-thg/scripts.sh
# Author      : Thiago Cangussu <cng.thg@gmail.com>
# Maintainer  : Thiago Cangussu <cng.thg@gmail.com>
# Date        : 20141226
# License     : BSD
#
# ---------------------------------------------------------------------------

# Add the repository to your APT sources
echo deb http://download.virtualbox.org/virtualbox/debian trusty contrib | \
sudo tee /etc/apt/sources.list.d/virtualbox.list

# Then import the repository key
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | \
sudo apt-key add -

# Install virtualbox
sudo apt-get update && sudo apt-get install -y virtualbox-4.3
