#!/usr/bin/env bash

# title: provision-base.sh
# description: performs apt-get update and installs base packages
# author: Sod Oscarfono | sod@catalyst.net.nz | @sodoscarfono
# created: 04/04/16
# last modified: 04/04/16

# lets roll with the latest and greatest
sudo apt-get update && sudo apt-get upgrade -yq
# we want some config management capabilities, the ability to build stuff,
# use git, containers, and all that entails
sudo apt-get install -yq ansible
