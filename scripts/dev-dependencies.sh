#!/bin/bash

# ---------------------------------------------------------------------------
#
# dev-dependencies.sh   : Install dev dependencies
#
# Usage       : chmod +x ./dev-dependencies.sh && ./dev-dependencies.sh
#
# Site        : github.com/cng-thg/scripts.sh
# Author      : Thiago Cangussu <cng.thg@gmail.com>
# Maintainer  : Thiago Cangussu <cng.thg@gmail.com>
# Date        : 20150111
# License     : BSD
#
# ---------------------------------------------------------------------------

# Your code here
PACKAGES=(python-dev libyaml-dev libpq-dev)

for package in ${PACKAGES[*]}
do
	sudo apt-get install -y ${package}
done
