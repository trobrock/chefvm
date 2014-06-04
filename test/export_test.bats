#!/usr/bin/env bats

setup() {
  touch $chefvm_root/configurations/example/knife.rb
  touch $chefvm_root/configurations/example/myuser.pem
  touch $chefvm_root/configurations/example/myvalidator.pem
}

@test "should have the exports directory" {
  chefvm_root=$(chefvm prefix)

  [ -d "$chefvm_root/exports" ]
}

@test "should create a tar file for the export" {
  chefvm_root=$(chefvm prefix)
  run chefvm export example

  [ "$status" -eq 0 ]
  [ "$output" = "Exporting: example" ]
  [ -f "$chefvm_root/exports/example.tar.gz" ]
}

@test "should ignore key files by default" {
  chefvm_root=$(chefvm prefix)
  run chefvm export example

  [ "$status" -eq 0 ]

  tempfile=$(mktemp -t chefvm-export-ignore-keys.XXXXXXXXXX)
  rm $tempfile
  mkdir -p $tempfile
  pushd $tempfile > /dev/null
  tar xzf $chefvm_root/exports/example.tar.gz

  [ -f "knife.rb" ]
  [ ! -f "myuser.pem" ]
  [ ! -f "myvalidator.pem" ]

  popd > /dev/null
  rm -rf $tempfile
}
