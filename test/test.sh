#!/usr/bin/env bash

shell=${1:-"$TEST_SHELL"}
shell=${shell:-"bash"}

if [ ! -x "$(which git 2> /dev/null)" ]; then
  echo "[setup] Installing git"
  sudo apt-get install -y git-core
fi

if [ ! -x "$(which bats 2> /dev/null)" ]; then
  echo "[setup] Installing bats"
  git clone https://github.com/sstephenson/bats.git
  pushd bats
  sudo ./install.sh /usr/local
  popd
fi

if [ "$shell" == "fish" ] && [ ! -x "$(which fish 2> /dev/null)" ]; then
  echo "[setup] Installing fish"
  sudo apt-get install -y fish
fi

if [ $TRAVIS_BUILD_DIR ]; then
  CODE_PATH=$TRAVIS_BUILD_DIR
else
  CODE_PATH="$HOME/.chefvm"
fi

echo "[setup] Running tests"
exec $CODE_PATH/test/test.$shell.sh
