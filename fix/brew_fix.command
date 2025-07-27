#!/usr/bin/env bash

# This is part of a larger script for setting a Mac for cloud infrastructure work, Python development, and ML/AI work. Thanks to Theo WAF for setting the foundation.
# Source = https://gist.github.com/m1yag1/bb0ffef90bbc40f313844ec92427ac95
set -e

# Shared functions

pretty_print() {
  printf "\n%b\n" "$1"
}
# 
pretty_print "Here we go..."

# So it begins

# timestamp
  pretty_print "Current time:"
          date 

# environment details
  pretty_print "Environment details:"
          env

# folder creation
  pretty_print "Ensuring folder structure for class is present..."
          mkdir -p $HOME/documents/TheoWAF/Logs
          mkdir -p $HOME/documents/TheoWAF/class7.5/GCP/Terraform
          mkdir -p $HOME/documents/TheoWAF/class7.5/GCP/Notes
          mkdir -p $HOME/documents/TheoWAF/class7.5/GCP/Homework
          mkdir -p $HOME/documents/TheoWAF/class7.5/GCP/Classes
          mkdir -p $HOME/documents/TheoWAF/class7.5/GCP/Books
          mkdir -p $HOME/documents/TheoWAF/class7.5/GCP/Files
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Terraform
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Notes
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Homework
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Classes
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Books
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Files

# Homebrew installation
  pretty_print "Homebrew install lines..."

if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..." 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
	eval "$(/opt/homebrew/bin/brew shellenv)"

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    pretty_print "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  pretty_print "You already have Homebrew installed...good job!"
fi

# Homebrew cleanup
  pretty_print "Cleaning brew files"
  	  brew cleanup

# Homebrew test
  pretty_print "Testing to see if Homebrew is now working..."
  	  brew help

  pretty_print "All set! If you were able to see text above this line, Homebrew is working! You should now be able to run the install file! If you still can't see the text above this line, try running the brewNuke.sh command!"