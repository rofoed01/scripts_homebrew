<<<<<<< HEAD
chmod a+x /$PWD/brewInstall.sh
chmod a+x /$PWD/brew_install.command
=======
#!/bin/sh

chmod a+x /$PWD/brewInstall.sh
chmod a+x /$PWD/brew_install.command
#sudo zsh  
>>>>>>> c3a600cfeb1367bb13c4958dd90b9c8d7adff830
/$PWD/brew_install.command -a 2>&1 | tee -a /$PWD/logs/"brewInstall$(date +%F)@$(date +%H:%M:%S).txt"