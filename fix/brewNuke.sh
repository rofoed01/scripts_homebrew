chmod a+x /$PWD/brewNuke.sh
chmod a+x /$PWD/brew_nuke.command
/$PWD/brew_nuke.command -a 2>&1 | tee -a /$PWD/logs/"brewNuke$(date +%F)@$(date +%H:%M:%S).txt" && tee -a /$HOME/documents/TheoWAF/Logs/"brewNuke$(date +%F)@$(date +%H:%M:%S).txt"