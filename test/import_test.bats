#!/usr/bin/env bats

setup() {
  touch $(chefvm prefix)/configurations/example/knife.rb
  touch $(chefvm prefix)/configurations/example/myuser.pem
  chefvm export example > /dev/null
}

teardown() {
  chefvm delete new_example > /dev/null
}

@test "should be able to import a configuration" {
  run chefvm import $(chefvm prefix)/exports/example.tar.gz new_example

  [ "$status" -eq 0 ]
  [ "$output" = "Importing '$(chefvm prefix)/exports/example.tar.gz' as 'new_example'" ]

  run chefvm list
  [ "${lines[0]}" = "*= example" ]
  [ "${lines[1]}" = "   new_example" ]
}
