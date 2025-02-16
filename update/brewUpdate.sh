chmod a+x /$PWD/brewUpdate.sh
chmod a+x /$PWD/brew_update.command
/$PWD/brew_update.command -a 2>&1 | tee -a /$PWD/logs/"brewUpdate$(date +%F)@$(date +%H:%M:%S).txt"
/$PWD/brew_update.command -a 2>&1 | tee -a /$HOME/documents/TheoWAF/Logs/"brewUpdate$(date +%F)@$(date +%H:%M:%S).txt"