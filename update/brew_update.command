#!/usr/bin/env bash

# This is part of a larger script for setting a Mac for cloud infrastructure work, Python development, and ML/AI work. Thanks to Theo WAF for setting the foundation.
# Source = https://gist.github.com/m1yag1/bb0ffef90bbc40f313844ec92427ac95
set -e

# Shared functions

pretty_print() {
  printf "\n%b\n" "$1"
}
# 
pretty_print "Launching Homebrew upgrades..."

# So it begins

# timestamp
  pretty_print "Current time:"
          date 

# environment details
  pretty_print "Environment details:"
          env

# folder creation
  pretty_print "Creating folder structure for class"
          mkdir -p $HOME/documents/TheoWAF/Logs
          mkdir -p $HOME/documents/TheoWAF/class6.5/GCP/Terraform
          mkdir -p $HOME/documents/TheoWAF/class6.5/GCP/Notes
          mkdir -p $HOME/documents/TheoWAF/class6.5/GCP/Homework
          mkdir -p $HOME/documents/TheoWAF/class6.5/GCP/Classes
          mkdir -p $HOME/documents/TheoWAF/class6.5/GCP/Books
          mkdir -p $HOME/documents/TheoWAF/class6.5/GCP/Files
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Terraform
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Notes
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Homework
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Classes
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Books
          mkdir -p $HOME/documents/TheoWAF/class7/AWS/Files

# Homebrew update
  pretty_print "Updating brew formulas..."
  	  brew update || brew upgrade

# Homebrew list
  pretty_print "Showing brew list..."
  	  brew list

# Homebrew cleanup
  pretty_print "Cleaning brew files..."
  	  brew cleanup

  pretty_print "Updates complete!"