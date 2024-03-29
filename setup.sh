#!/bin/bash

# ====================== List of Functions ====================== # 

# Needed Package upon running the setup.sh
initPackages(){
	installPackage figlet
	installLolcat	
}

# Print the header design
header () {
  clear
  figlet -f Standard " Ubuntu Setup  " | lolcat
  echo -e "    Created a simple installer to automate downloading of\n            my applications and customizations\n" | lolcat
  echo "    Created By    : Jookie262" | lolcat
  echo "    Github        : https://github.com/Jookie262/my-ubuntu-setup" | lolcat 
}

# Checks if a certain package is installed
# Returns yes or no
checkPackage(){
	if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
		isInstalled="no"
	else
		isInstalled="yes"
	fi
}

# Install the package if the checkPackage method returns no
installPackage(){
  checkPackage $1
  if [[ $isInstalled == "no" ]]; then
    sudo apt-get install $1 -y
  fi
}

# Install the packages needed for lolcat (for colorful text)
installLolcat(){
  # Install the lolcat package first
  installPackage lolcat	
  # Checks if the lolcat package is successfull
  checkPackage lolcat
  # If the lolcat package cannot be able to install then execute inside the if statement
  if [[ $isInstalled == "no" ]]; then
    installPackage gem
    installPackage gcc
    installPackage make
    installPackage lolcat	    
  fi
}

# Options for Applications
listApplication() {
  echo ""
  echo "  =================== List of Applications ===================="
  echo "  [1] Google Chrome                                         Yes"
  echo "  [2] Gnome-Tweak                                           Yes"
  echo "  [3] Visual Studio Code                                    Yes"
  echo "  [4] VLC                                                   Yes" 
  echo "  [5] Free Download Manager                                 Yes" 
  echo "  [6] Filezilla                                             Yes" 
  echo "  [7] Vim                                                   Yes" 
  echo "  [8] Anydesk                                               Yes" 
  echo "  =============================================================" 
}

# Ask user to select repeatedly until the user enters letter N
selectOptions() {
  echo ""
  while true
  do
    read -p "  Select: " ans
    
    if [ $ans == "N" ]; then
      return 1
    fi

  done
}

# ====================== End of Functions ====================== # 



# ====================== Start of Main ====================== # 

# Update Repositories
# sudo apt update -y

# Call method that installs the needed packages
initPackages

# Call header function
header

# List All Applications
listApplication

# Call the selectOptions function
selectOptions

# ====================== End of Main ====================== # 
