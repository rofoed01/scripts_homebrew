#!/usr/bin/env bash

# This is part of a larger script to set a Mac for cloud infrastructure work, Python development, and ML/AI work. Thanks to Theo WAF for setting the foundation.
# Source = https://gist.github.com/m1yag1/bb0ffef90bbc40f313844ec92427ac95

# if user interaction is needed user this command
# bash  <(curl -fsSL https://raw.githubusercontent.com/rofoed01/scripts_homebrew/refs/heads/main/brew_install_SEIR-Foundations.command)

# when set, any errors will stop the script from running
# set -e

# Shared functions
pretty_print() {
  printf "\n%b\n" "$1"
}

pretty_print "Ready to be jacked in, Neo? Here we go..."

# Ask for the administrator password upfront
pretty_print "The computer will ask for your password just in case anything needs it."
echo ""
sudo -v
# Keep-alive: update existing sudo time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# So it begins

# timestamp
pretty_print "Current time"
date 

# environment details
pretty_print "Environment details:"
env

# folder creation
pretty_print "Creating folder structure for class..."
mkdir -p $HOME/documents/TheoWAF/Logs
mkdir -p $HOME/documents/TheoWAF/class8/SEIR_Foundations/AWS/{Terraform,Notes,Homework,Classes,Books,Files}
# mkdir -p $HOME/documents/TheoWAF/class8

# Homebrew installation
pretty_print "Homebrew installation..."

if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..." 
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

brew update 

# Homebrew installs; quality of life
pretty_print "Installing core Homebrew utilities...one sec..."
brew install coreutils findutils bash openssl@3 ca-certificates htop tmux tree
    
# Homebrew installs; regular apps
pretty_print "Installing apps via Homebrew...hold on..."
brew install google-chrome 
brew install --cask firefox
brew install --cask brave-browser
brew install --cask zoom
brew install --cask visual-studio-code
brew install --cask obsidian
brew install --cask anki 

# brew install wireguard
# brew install --cask discord
# brew install --cask telegram
# brew install --cask vlc

# Homebrew installs; cloud infrastructure
pretty_print "Installing programming & cloud tools via Homebrew...patience..."
brew install git gh wget jq 
brew install python3
brew install awscli 
brew install opentofu


# Remove Terraform if it was previously installed from Homebrew/core
if brew list --formula terraform &>/dev/null; then
  if brew list --formula --full-name | grep -q '^terraform$'; then
    pretty_print "Removing Terraform from the old Homebrew/core formula..."
    brew uninstall terraform
  fi
fi

brew tap hashicorp/tap && brew install hashicorp/tap/terraform
brew install --cask google-cloud-sdk  < /dev/null


# brew install pytorch ollama libtensorflow go rust
# brew install terragrunt vsh
# brew install sensible docker docker-compose docker-completion
# brew install kubernetes-cli kustomize minikube k6 make istioctl k9s helm kubectx prometheus grafana nmap trivy atmos
# brew install --cask datadog-agent
# brew install --cask nessus
# brew install --cask anaconda  
# brew install --cask sentinel 
# brew install --cask zap 
# brew install little-snitch

# Homebrew list
pretty_print "Showing brew list..."
brew list

# Homebrew cleanup
pretty_print "Cleaning brew files..."
brew cleanup

# Verify installations
pretty_print "Verifying core tool installations..."
echo "========================================================"
echo "ACTION REQUIRED: Please review the version output below."
echo "Make sure none of these commands display an error."
echo "========================================================"
echo ""

echo "[Terraform]"
terraform --version
echo ""

echo "[Python 3]"
python3 --version
echo ""

echo "[AWS CLI]"
aws --version
echo ""

echo "[Git]"
git --version
echo ""
echo "========================================================"

pretty_print "If you don't see any errors then you're all set!"
