#!/bin/bash

# ====================== List of Functions ====================== # 

# Print the header design
header () {
    clear
    figlet -f Big "Ubuntu Setup  "
    echo -e "    Created a simple installer to automate downloading of\n            my applications and customizations\n"
    echo "    Created By     : Jookie262"
    echo "    Github         : https://github.com/Jookie262/my-ubuntu-setup"
}

# Check if a certain package is installed
# Install if not found otherwise print "Already Installed"
checkPackage(){
 if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
 then
   sudo apt-get install $1 -y;
 else
   echo "Already Installed";
 fi
}

# ====================== End of Functions ====================== # 



# ====================== Start of Main ====================== # 

# Update Repositories
sudo apt update -y

# Install Figlet for Header Art
checkPackage figlet 

# Call header function
header

# ====================== End of Main ====================== # 
