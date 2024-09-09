#!/bin/sh

chmod a+x /$PWD/brewInstall.sh
chmod a+x /$PWD/brew_install.command
sudo zsh  
/$PWD/brew_install.command -a 2>&1 | tee -a /$PWD/logs/"brewInstall$(date +%F)@$(date +%H:%M:%S).txt"