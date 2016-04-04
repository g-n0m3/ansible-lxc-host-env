#!/usr/bin/env bash

# title: provision-base.sh
# description: performs apt-get update and installs base packages with
#              a little special sauce thrown in too.
# author: Sod Oscarfono | sod@catalyst.net.nz | @sodoscarfono
# created: 04/04/16
# last modified: 04/04/16

# lets roll with the latest and greatest
sudo apt-get update && sudo apt-get upgrade -yq
# we want some config management capabilities, the ability to build stuff,
# use git, containers, and all that entails
sudo apt-get install -yq ansible build-essential git lxc lxc-dev python2.7-dev
# this may not be necessary but may help
sudo usermod -aG staff vagrant
# python 2.x bindings for lxc are necessary because:
#
cd /usr/local/src && git clone https://github.com/lxc/python2-lxc.git
cd python2-lxc
sudo python setup.py build
sudo python setup.py install
