#!/bin/bash
#
# Title: os-config.sh
# Author: Pelochus
# Version: 1.0
# Brief: Automates OS maintenance for my home server

#############
### Functions
#############

menu() {
    echo "-------------------------------------------------------------------------------------------------"
    echo 
    echo "  ### MENU - Choose an option"
    echo 
    echo "  [1] Safe run (options 2 to 5)"
    echo "  [2] Update system"
    echo "  [3] Update Pi-Hole"
    echo "  [4] Clean APT cache && remove unnecessary dependencies"
    echo "  [5] Reboot"
    echo "  [0] Exit"
    echo 
    echo "-------------------------------------------------------------------------------------------------"
}

options() {
    case $1 in 
    
        # Update and autoclean
        # See README.md for information why full-upgrade instead of upgrade
        2 | 1)
           apt update && apt full-ugprade -y && apt autoclean
        ;;&
        
        # Updates PiHole (mainly adlists, could update anything extra PiHole considers)
        3 | 1)
           pihole -up
        ;;&

        # Clean ALL apt cache and unnecessary dependencies
        4 | 1)
            sudo apt clean && sudo apt autoremove
        ;;&

        # Reboot
        5 | 1)
            sudo reboot
        ;;

        # Exit
        0)
            echo
            echo "-----------"
            echo "Exiting now"
            echo "-----------"
            echo
            exit
        ;;

    esac
}

########
### Main
########

clear

# Run with parameters
if [ $# -gt 0 ]
then
    if [ $1 == '-h' ] || [ $1 == '--help' ]
    then
        echo
        echo "pelochus-homelab OS Maintenance Script Help"
        echo
        echo "-a / --auto: Runs all options that don't require user's help. Needs root privileges"
        echo "-h / --help: Shows this help screen"
        echo 
        echo "For more information visit https://github.com/Pelochus/pelochus-homelab/os"
        echo
        exit 
    elif [ $1 == '-a' ] || [ $1 == '--auto' ] 
    then
        options 1
        echo
        echo "//////////////////////////////"
        echo "Finished automatic maintenance"
        echo "//////////////////////////////"
        echo
        exit
    fi 
fi

echo
echo "-------------------------------------------------------------------------------------------------"
echo "This is a script for auto maintaining OS"
echo "This script will need root privileges for doing certain things"
echo "If you are running this script as sudo, you can continue, else the script will fail"
echo "Are you running as sudo? [Y/N]"
echo "-------------------------------------------------------------------------------------------------"
echo

read continue

if [ $continue == 'Y' ] || [ $continue == 'y' ]
then
    clear
    while true
    do
        menu 
        read chosen 
        options $chosen
    done
else
    echo
    echo "-----------"
    echo "Exiting now"
    echo "-----------"
    echo
fi
