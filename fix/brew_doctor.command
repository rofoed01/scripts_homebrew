#!/usr/bin/env bash

# This is part of a larger script for setting a Mac for cloud infrastructure work, Python development, and ML/AI work. Thanks to Theo WAF for setting the foundation.
# Source = https://gist.github.com/m1yag1/bb0ffef90bbc40f313844ec92427ac95

# when set, any errors will stop the script from running
# set -e

# Shared functions

pretty_print() {
  printf "\n%b\n" "$1"
}
# 
pretty_print "The doctor is in; let's patch Homebrew up!"

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

 # Homebrew doctor; check whether the install is healthy
  pretty_print "Checking Homebrew install health..."
  	  brew doctor

# Homebrew cleanup
  pretty_print "Cleaning brew files..."
  	  brew cleanup

  pretty_print "Listen to the doctor, follow its suggestions, and fix up Homebrew! All set!"