chmod a+x /$PWD/brewDoctor.sh
chmod a+x /$PWD/brew_doctor.command
/$PWD/brew_doctor.command -a 2>&1 | tee -a /$PWD/logs/"brewDoctor$(date +%F)@$(date +%H:%M:%S).txt"