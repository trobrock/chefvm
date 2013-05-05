#!/usr/bin/env bats

setup() {
  chefvm create test
  chefvm use example
}

teardown() {
  chefvm delete test
  chefvm default example
}

@test "should list all the configurations" {
  run chefvm list

  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "   test" ]
  [ "${lines[0]}" = "*= example" ]
}

@test "should show the active and default configuration" {
  chefvm use test

  run chefvm list
  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "=> test" ]
  [ "${lines[0]}" = "*  example" ]
}
