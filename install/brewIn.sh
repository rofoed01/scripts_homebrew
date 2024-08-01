chmod a+x /$PWD/brewIn.command
chmod a+x /$PWD/brew_install.command
/$PWD/brew_install.command -a | tee -a /$PWD/logs/"brewInstall$(date +%F)@$(date +%H:%M:%S).txt"