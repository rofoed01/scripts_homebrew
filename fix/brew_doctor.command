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

 # Homebrew doctor; check whether the install is healthy
  pretty_print "Checking Homebrew install health..."
  	  brew doctor

# Homebrew cleanup
  pretty_print "Cleaning brew files..."
  	  brew cleanup

  pretty_print "Listen to the doctor, and fix up Homebrew! All set!"