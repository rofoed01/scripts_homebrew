#!/usr/bin/env bash

# This is part of a larger script for setting a Mac for cloud infrastructure work, Python development, and ML/AI work. Thanks to Theo WAF for setting the foundation.
# Source = https://gist.github.com/m1yag1/bb0ffef90bbc40f313844ec92427ac95

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

# 1. Dynamically identify Homebrew path based on Apple vs Intel architecture
if [[ "$(uname -m)" == "arm64" ]]; then
  BREW_BIN="/opt/homebrew/bin/brew"
else
  BREW_BIN="/usr/local/bin/brew"
fi

# 2. Check if brew is installed either via PATH or absolute location
if ! command -v brew &>/dev/null && [ ! -x "$BREW_BIN" ]; then
  pretty_print "Installing Homebrew, an OSX package manager. The script will pause and ask for your permission to proceed..." 
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  pretty_print "You already have Homebrew installed...good job!"
fi

# 3. Activate Homebrew for the script and save for future terminal sessions
if [ -x "$BREW_BIN" ]; then
  eval "$("$BREW_BIN" shellenv)"
  
  if ! grep -qs 'brew shellenv' ~/.zprofile; then
    pretty_print "Configuring PATH for Homebrew in ~/.zprofile..."
    echo "eval \"\$($BREW_BIN shellenv)\"" >> ~/.zprofile
  fi
else
  pretty_print "Error: Homebrew binary not found. Installation may have failed."
  exit 1
fi

# Homebrew installs; quality of life
pretty_print "Installing core Homebrew utilities...one sec..."
brew install coreutils findutils bash openssl@3 ca-certificates htop tmux tree
    
# Homebrew installs; regular apps
pretty_print "Installing apps via Homebrew...hold on..."
brew install --cask google-chrome 
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
brew install awscli azure-cli opentofu
brew tap hashicorp/tap && brew install hashicorp/tap/terraform
brew install --cask google-cloud-sdk < /dev/null


# brew install pytorch ollama libtensorflow go rust
# brew install terragrunt vsh
# brew install sensible docker docker-compose docker-completion
# brew install kubernetes-cli kustomize minikube k6 make istioctl k9s helm kubectx prometheus grafana nmap trivy atmos
# brew install --cask datadog-agent
# brew install --cask nessus
# brew install --cask anaconda  
# brew install --cask sentinel 
# brew install --cask zap 
# brew install --cask little-snitch

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