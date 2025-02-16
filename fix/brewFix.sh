chmod a+x /$PWD/brewFix.sh
chmod a+x /$PWD/brew_fix.command
/$PWD/brew_fix.command -a 2>&1 | tee -a /$PWD/logs/"brewFix$(date +%F)@$(date +%H:%M:%S).txt"
/$PWD/brew_fix.command -a 2>&1 | tee -a /$HOME/documents/TheoWAF/Logs/"brewFix$(date +%F)@$(date +%H:%M:%S).txt"