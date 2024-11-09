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
  pretty_print "Homebrew installation..."

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

# Homebrew installs; quality of life
  pretty_print "Installing core Homebrew utilities...one sec..."
  	  brew install coreutils findutils bash openssl@3 ca-certificates
	  
# Homebrew installs; regular apps
  pretty_print "Installing apps via Homebrew...hold on..."
  	  brew install google-chrome wireguard-go --cask brave-browser --cask zoom --cask visual-studio-code --cask telegram --cask vlc --cask discord

# Homebrew installs; cloud infrastructure
  pretty_print "Installing cloud tools via Homebrew...patience..."
	  Brew install git gh wget python3 terraform terragrunt opentofu ansible docker docker-compose docker-completion kubernetes-cli minikube make jq istiocli k6 k9s helm awscli azure-cli prometheus grafana nmap --cask google-cloud-sdk  --cask zap --cask docker --cask anaconda --cask datadog-agent --cask anki 
#	  brew install pytorch ollama --cask nessus
	 

# Homebrew list
  pretty_print "Showing brew list..."
  	  brew list

# Homebrew cleanup
  pretty_print "Cleaning brew files..."
  	  brew cleanup

  pretty_print "All set!"