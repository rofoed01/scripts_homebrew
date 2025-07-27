#!/usr/bin/env bash

# This is part of a larger script for setting a Mac for cloud infrastructure work, Python development, and ML/AI work. Thanks to Theo WAF for setting the foundation.
# Source = https://gist.github.com/m1yag1/bb0ffef90bbc40f313844ec92427ac95
set -e

# Shared functions

pretty_print() {
  printf "\n%b\n" "$1"
}
# 
pretty_print "You activated the nuclear warhead; let's tear down Homebrew..."

# So it begins

# timestamp
  pretty_print "Current time:"
          date 

# environment details
  pretty_print "Environment details:"
          env

# folder structure
  pretty_print "Creating a record of destruction..."
          mkdir -p $HOME/documents/TheoWAF/Logs

# Homebrew list
  pretty_print "Showing brew list..."
  	  brew list

# Homebrew uninstallation 1
  pretty_print "Uninstalling Homebrew formulae..."
      brew remove --force $(brew list --formula) 

# Homebrew uninstallation 2
  pretty_print "Uninstalling Homebrew casks..."
      brew remove --cask --force $(brew list)

# Homebrew uninstallation 3
  pretty_print "Uninstalling Homebrew program..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

  pretty_print "All set! Run the brewFix.sh or brew_fix.command file if you want to reinstall Homebrew!"

