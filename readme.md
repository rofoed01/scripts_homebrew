Install Instructions 

1. Click on the magnifying glass in the top right hand corner.
2. Type in "terminal", and open the Terminal application.
3. Open Finder and select the "scripts_brew" folder, wherever it is located.
4. Right click on the folder and select the "Open Terminal at folder" option at the bottom. 
  If you cannot right click, select the circle with 3 dots icon in the upper right hand corner of Finder (to the left of Finder's magnifying glass).
5. Type "ls" to verify you can see the "permissions.sh" file.
6. Type the following in terminal: chmod +x permissions.sh
7. Type the following in terminal: ./permissions.sh
8. Type the following in terminal: cd install
9. Type the following in terminal: ./brewInstall.sh
10. Exercise patience and let the installs finish; this may take 30-45 minutes and upwards of 30 GB of disk space. 
  Zoom and other programs WILL RESTART during the install, so if on a Zoom call, do not panic, just rejoin once Zoom is listed as finished.
11. Anaconda (far down on the list) will take at minimum 20 minutes to install based on connection speed.
12. Refer back to the Class 6.5 install document (https://docs.google.com/document/d/1NigriGLA6Es6dsI6TtJAhkvHOeLkUponNqm2YaaiaHw/edit?usp=sharing) when the installs are finished (aka when Terminal says "All set!").


If you want a quick and dirty way to run the scripts, do the following:

1. Click on the magnifying glass in the top right hand corner.
2. Type in "terminal", and open the Terminal application.
3. Open Finder and open the folder where the "scripts_brew" folder is located.
4. Go to the install, fix, or update folder, depending on whether you need to install, fix, or update Homebrew.
5. Click and drag the appropriate file ending in ".command" into Terminal.
6. Press Enter, and the script will start running.


Troubleshooting

1. If you see the error message saying "brew: command not found" in your Terminal, Homebrew isn't installed correctly.
2. Go to the fix folder in Terminal, and either type "./brewFix.sh" in Terminal, or drag the "brew_fix.command" file into Terminal and press Enter.
3. If you want to validate the health of your Homebrew install, run either "brewDoctor.sh" or "brew_doctor.command" in Terminal.
4. If you want to uninstall everything Homebrew related, run either "brewNuke.sh" or "brew_nuke.command" in Terminal.