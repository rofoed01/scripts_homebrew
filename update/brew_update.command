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
  pretty_print "Current time"
          date 

# environment details
  pretty_print "Environment details:"
          env

# Homebrew installation
  pretty_print "Test..."

# Homebrew list
  pretty_print "Showing brew list"
  	  brew list

# Homebrew update
  pretty_print "Updating brew formulas"
  	  brew update || brew upgrade

# Homebrew cleanup
  pretty_print "Cleaning brew files"
  	  brew cleanup

  pretty_print "All set!"