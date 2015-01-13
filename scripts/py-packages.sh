#!/bin/bash

# ---------------------------------------------------------------------------
#
# py-packages.sh   : Install a list of python packages
#
# Usage       : chmod +x ./py-packages.sh && ./py-packages.sh
#
# Site        : github.com/cng-thg/scripts.sh
# Author      : Thiago Cangussu <cng.thg@gmail.com>
# Maintainer  : Thiago Cangussu <cng.thg@gmail.com>
# Date        : 20150111
# License     : BSD
#
# ---------------------------------------------------------------------------

# Your code here
PACKAGES=(cookiecutter fig awscli pypi-cli pgcli)

DEPENDENCIES=(python-dev libyaml-dev libpq-dev)

sudo -H pip install ${PACKAGES[*]}
