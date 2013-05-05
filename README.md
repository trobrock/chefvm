# ChefVM

[![Build Status](https://travis-ci.org/trobrock/chefvm.png?branch=master)](https://travis-ci.org/trobrock/chefvm)

Simple Chef environment manager, usage inspired by wayneeseguin/rvm

## Installation

    # Chefvm will create a symlink between (~/.chefvm -> ~/.chef ), make sure you have no ~/.chef directory before installing
    mv ~/.chef ~/.chef.bak
    git clone git://github.com/trobrock/chefvm.git ~/.chefvm
    ~/.chefvm/bin/chefvm init # Follow these instructions
    
After following these instructions reload your terminal, then

    chefvm create old_config
    mv ~/.chef.bak/* ~/.chefvm/configurations/old_config
    rm -rf ~/.chef.bak

## Usage

Put the files (knife.rb, pem keys, etc...) that you would normally have in `~/.chef` into a folder named whatever you want in the configurations folder, then you can use that name in place of `YOUR_CHEF_CONFIG` in the below commands

    # Use a specific config
    chefvm use {YOUR_CHEF_CONFIG|default}
    # or
    chefvm YOUR_CHEF_CONFIG

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

    # Rename a config
    chefvm rename OLD_CONFIG NEW_CONFIG

    # Open a config directory in $EDITOR
    chefvm edit YOUR_CHEF_CONFIG

    # Update chefvm to the latest
    chefvm update


## Handy Prompt function
You can use `chefvm current` in PS1 in bash to see your current config in your prompt

    PS1="\$(chefvm current)" $

## Contributing

Fork and send a pull request.

# Running tests

The following will bring up an ubuntu based vm, install chefvm, and run the bats tests against it.

```shell
vagrant up
```

While the vm is up you can run the following to re-run tests without rebuilding the vm.

```shell
vagrant provision
```

When you are done.

```shell
vagrant down
```

# Contributors

Jesse Nelson [https://github.com/spheromak]
