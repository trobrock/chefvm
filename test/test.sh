#!/usr/bin/env bash

# This is for bootstrapping and run tests on the vm

if [ ! -x "$(which git 2> /dev/null)" ]; then
  sudo apt-get install -y git-core
fi

if [ ! -x "$(which bats 2> /dev/null)" ]; then
  git clone https://github.com/sstephenson/bats.git
  cd bats
  sudo ./install.sh /usr/local
fi

if [ $TRAVIS_BUILD_DIR ]; then
  CODE_PATH=$TRAVIS_BUILD_DIR
else
  CODE_PATH="$HOME/.chefvm"
fi

eval "$($CODE_PATH/bin/chefvm init -)"

bats $CODE_PATH/test
