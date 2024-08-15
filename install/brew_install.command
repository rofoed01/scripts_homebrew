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
pretty_print "Ready to be jacked in, Neo? Here we go..."

# So it begins

# timestamp
  pretty_print "Current time"
          date 

# environment details
  pretty_print "Environment details:"
          env

# Homebrew installation
  pretty_print "Homebrew install lines..."

if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..." 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    pretty_print "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  pretty_print "You already have Homebrew installed...good job!"
fi

# Homebrew doctor; check whether the install is healthy
#  pretty_print "Checking Homebrew install health..."
#  	  brew doctor


# Homebrew installs; quality of life
  pretty_print "Installing core Homebrew utilities...one sec..."
  	  brew install coreutils
	  brew install findutils
	  brew install bash
	  brew install openssl

# Homebrew installs; regular apps
  pretty_print "Installing apps via Homebrew...hold on..."
  	  brew install google-chrome
	  brew install wireguard-go
	  brew install --cask brave-browser
	  brew install --cask zoom
	  brew install --cask visual-studio-code
	  brew install --cask telegram
	  brew install --cask vlc
	  brew install --cask discord

# Homebrew installs; cloud infrastructure
  pretty_print "Installing cloud tools via Homebrew...patience..."
	  Brew install git
	  Brew install gh
	  Brew install python3
	  Brew install terraform
	  brew install terragrunt
	  Brew install opentofu
	  brew install docker
	  brew install docker-compose
	  Brew install kubernetes-cli
	  brew install minikube
	  brew install k9s
	  Brew install helm
	  Brew install awscli
	  Brew install azure-cli
	  brew install prometheus
	  brew install grafana
#	  brew install pytorch
#	  brew install ollama
	  brew install --cask google-cloud-sdk
	  Brew install --cask zap
	  brew install --cask docker
#	  brew install --cask nessus
	  brew install --cask anaconda
	  brew install --cask datadog-agent



# Homebrew list
  pretty_print "Showing brew list..."
  	  brew list

# Homebrew cleanup
  pretty_print "Cleaning brew files..."
  	  brew cleanup

  pretty_print "All set!"