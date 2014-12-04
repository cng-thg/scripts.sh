#!/bin/sh

# ---------------------------------------------------------------------------
#
# pip.sh      : Install pip from bootstrap.pypa.io
#
# Usage       : chmod +x ./pip.sh && ./pip.sh
#
# Site        : github.com/cng-thg/pip.sh
# Author      : Thiago Cangussu <cng.thg@gmail.com>
# Maintainer  : Thiago Cangussu <cng.thg@gmail.com>
# Date        : 20141204
# License     : BSD
#
# ---------------------------------------------------------------------------

# Your code here

curl -sSL https://bootstrap.pypa.io/get-pip.py | sudo python
