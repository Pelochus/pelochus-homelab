#!/bin/bash
#
# Title: template-script.sh
# Author: Pelochus
# Version: 1.0
# Brief: Template script for the other scripts that will automate the installation and configuration of my server

# TODO 
# Finish options function
# See if exit works
# Do something simple with 1 and 2 options
# Try to "waterfall" option 3 with 1 and 2

### Functions
menu() {
    clear
    echo "-------------------------------------------------------------------------------------------------"
    echo 
    echo "  ### MENU - Choose an option"
    echo 
    echo "  [1] Do something"
    echo "  [2] Do something 2"
    echo "  [3] Do everything above"
    echo "  [4] Exit"
    echo 
    echo "-------------------------------------------------------------------------------------------------"
}

options() {
    case $1 in 
    
        # Do something
        1)

        ;;

        # Do something 2
        2)

        ;;

        # Do everything above  
        3)

        ;;

        # Do something
        4)
            echo "-----------"
	        echo "Exiting now"
	        echo "-----------"
            exit
        ;;

    esac
}

### Main
clear

echo
echo "-------------------------------------------------------------------------------------------------"
echo "This is a template script, does nothing"
echo "The scripts for automating the server probably will need root privileges for doing certain things"
echo "If you are running this script as sudo, you can continue"
echo "Are you running as sudo? [Y/N]"
echo "-------------------------------------------------------------------------------------------------"
echo

read continue

if [ $continue == 'Y' ] || [ $continue == 'y' ]; then
	while true do
        menu 
        read chosen 
        options $chosen
    done
else
	echo "-----------"
	echo "Exiting now"
	echo "-----------"
fi