#!/usr/bin/env bash

__chefvm_config()
{
  configurations="configurations"
  current_path="$_CHEFVM_ROOT/current"

  config=$1
  if [[ -z "$config" ]]; then
    config=$(readlink $current_path | sed "s/$configurations\///")
  fi

  default_path="$_CHEFVM_ROOT/$configurations/default"
  config_path="$configurations/$config"

  if [[ "$config" == "default" ]]; then
    config=$(readlink $default_path)
  fi

  return 0
}
export -f __chefvm_config
