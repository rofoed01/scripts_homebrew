chmod a+x /$PWD/brewUp.command
chmod a+x /$PWD/brew_update.command
/$PWD/brew_update.command -a | tee -a /$PWD/logs/"brewUpdate$(date +%F)@$(date +%H:%M:%S).txt"