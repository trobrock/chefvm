# ChefVM

Simple Chef environment manager, usage inspired by wayneeseguin/rvm

## Installation

    git clone git://github.com/trobrock/chefvm.git ~/.chefvm

### Bash

    echo '[[ -s "$HOME/.chefvm/scripts/chefvm" ]] && . "$HOME/.chefvm/scripts/chefvm"' >> ~/.bash_profile

### Zsh

    echo '[[ -s "$HOME/.chefvm/scripts/chefvm" ]] && . "$HOME/.chefvm/scripts/chefvm"' >> ~/.zshenv

## Usage

Put the files (knife.rb, pem keys, etc...) that you would normally have in `~/.chef` into a folder named whatever you want in the configurations folder, then you can use that name in place of `YOUR_CHEF_CONFIG` in the below commands

    # Use a specific config
    chefvm use {YOUR_CHEF_CONFIG|default}

    # Set your default config
    chefvm default YOUR_CHEF_CONFIG

    # List your configurations, including current and default
    chefvm list

    # Create a new config
    chefvm create YOUR_CHEF_CONFIG

    # Delete a config
    chefvm delete YOUR_CHEF_CONFIG

    # Copy a config
    chefvm copy SRC_CONFIG DEST_CONFIG

    # Open a config directory in $EDITOR
    chefvm edit YOUR_CHEF_CONFIG


## Handy Prompt function
You can use the following function in your .bashrc then call it in your $PS1 variable

    function knife_config {
      if [ -e ~/.chef ] ; then
        echo $( cd -P ~/.chef ; basename $PWD )
      fi
    }

    PS1="\$(knife_config)" $

