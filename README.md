# ChefVM

Simple Chef environment manager, usage inspired by wayneeseguin/rvm

## Installation

    git clone git://github.com/trobrock/chefvm.git ~/.chefvm

### Bash

    echo '[[ -s "$HOME/.chefvm/scripts/chefvm" ]] && . "$HOME/.chefvm/scripts/chefvm"' >> ~/.bash_profile

### Zsh

    echo '[[ -s "$HOME/.chefvm/scripts/chefvm" ]] && . "$HOME/.chefvm/scripts/chefvm"' >> ~/.zshenv

## Usage

    chefvm use {YOUR_CHEF_CONFIG|default}
    chefvm default YOUR_CHEF_CONFIG
