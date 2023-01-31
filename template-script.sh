#!/bin/bash
#
# Title: template-script.sh
# Author: Pelochus
# Version: 1.0
# Brief: Template script for the other scripts that will automate the installation and configuration of my server

#############
### Functions
#############

menu() {
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
        1 | 3)
            ls -l
            sleep 2
        ;;& 
        # This "&" makes it possible to execute following options. Used for executing 1 and 2 when 3 is the input

        # Do something 2
        2 | 3)
            echo "I'm doing something 2"
            sleep 2
        ;;

        # Exit
        4)
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
        echo "pelochus-homelab Template Script Help"
        echo
        echo "-a / --auto: Runs all options that doesn't require user's help. Needs root privileges"
        echo "-h / --help: Shows this help screen"
        echo 
        echo "For more information visit https://github.com/Pelochus/pelochus-homelab"
        echo
        exit 
    elif [ $1 == '-a' ] || [ $1 == '--auto' ] 
    then
        options 3
        echo
        echo "///////////////////////////////"
        echo "Finished automatic installation"
        echo "///////////////////////////////"
        echo
        exit
    fi 
fi

echo
echo "-------------------------------------------------------------------------------------------------"
echo "This is a template script, does nothing"
echo "The scripts for automating the server probably will need root privileges for doing certain things"
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