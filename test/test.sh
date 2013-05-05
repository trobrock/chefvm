#!/usr/bin/env bash

# This is for bootstrapping and run tests on the vm

if [ ! -x "$(which git 2> /dev/null)" ]; then
  sudo apt-get install -y git-core
fi

if [ ! -x "$(which bats 2> /dev/null)" ]; then
  git clone https://github.com/sstephenson/bats.git
  cd bats
  ./install.sh /usr/local
fi

if [ ! -x "$HOME/.chefvm/bin/chefvm" ]; then
  git clone git://github.com/trobrock/chefvm.git ~/.chefvm
fi
eval "$(~/.chefvm/bin/chefvm init -)"

bats /chefvm/test/*.bats
