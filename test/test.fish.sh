#!/usr/bin/env fish

if test -n "$TRAVIS_BUILD_DIR"
  set CODE_PATH $TRAVIS_BUILD_DIR
else
  set CODE_PATH $HOME/.chefvm
end

function chefvm_init
  eval $CODE_PATH/bin/chefvm init -
end

echo $PATH
eval (chefvm_init)

bats $CODE_PATH/test
