#!/usr/bin/env bats

@test "should print the chefvm root" {
  run chefvm prefix

  [ "$status" -eq 0 ]
  if [ ! -z $TRAVIS_BUILD_DIR ]; then
    [ "$output" = "$TRAVIS_BUILD_DIR" ]
  else
    [ "$output" = "/root/.chefvm" ]
  fi
}
