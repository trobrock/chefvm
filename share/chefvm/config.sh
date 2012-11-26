#!/usr/bin/env bash

__chefvm_config()
{
  root_dir="$HOME/.chefvm"
  configurations="configurations"
  current_path="$root_dir/current"

  config=$1
  if [[ -z "$config" ]]; then
    config=$(readlink $current_path | sed "s/$configurations\///")
  fi

  default_path="$root_dir/$configurations/default"
  config_path="$configurations/$config"

  if [[ "$config" == "default" ]]; then
    config=$(readlink $default_path)
  fi
}
