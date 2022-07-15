#!/bin/bash

# ====================== List of Functions ====================== # 

# Print the header design
header () {
  clear
  figlet -f Standard " Ubuntu Setup  "
  echo -e "    Created a simple installer to automate downloading of\n            my applications and customizations\n"
  echo -e "    Created By    : Jookie262"
  echo -e "    Github        : https://github.com/Jookie262/my-ubuntu-setup" 
}

# Checks if a certain package is installed
# Install if not found otherwise print "Already Installed"
checkPackage(){
  if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    sudo apt-get install $1 -y;
  else
    echo "Already Installed";
  fi
}

# Ask user to select repeatedly until the user enters letter N
selectOptions() {
  echo ""
  while true
  do
    read -p "  Select: " ans
    
    if [[ $ans == "N" ]] || [[ $ans == "n" ]]; then
      return 1
    fi

  done
}

# ====================== End of Functions ====================== # 



# ====================== Start of Main ====================== # 

# Update Repositories
sudo apt update -y

# Install Figlet for Header Art
checkPackage figlet 

# Call header function
header

# Call the selectOptions function
selectOptions

# ====================== End of Main ====================== # 
