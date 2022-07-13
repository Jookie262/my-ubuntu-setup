#!/bin/bash

# Update Repositories
sudo apt update -y

# Install Figlet for Art
sudo apt install Figlet lolcat -y

clear

figlet -f Big "Ubuntu Setup  " | lolcat
echo -e "    Created a simple installer to automate downloading of\n            my applications and customizations\n" | lolcat
echo "    Created By     : Jookie262" | lolcat
echo "    Github         : https://github.com/Jookie262/my-ubuntu-setup" | lolcat
