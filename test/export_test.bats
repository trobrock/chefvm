#!/usr/bin/env bats

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
