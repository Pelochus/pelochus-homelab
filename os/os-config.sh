#!/bin/bash
#
# Title: os-config.sh
# Author: Pelochus
# Version: 1.0
# Brief: Automates OS configuration for my home server

#############
### Functions
#############

menu() {
    echo "-------------------------------------------------------------------------------------------------"
    echo 
    echo "  ### MENU - Choose an option"
    echo 
    echo "  [1] Do everything"
    echo "  [2] Enable SWAP (8 GB)"
    echo "  [3] Set automatic system updates and automatic reboots in cron"
    echo "  [4] Enable 3D Hardware acceleration in Armbian for Orange Pi 5"
    echo "  [5] Exit"
    echo 
    echo "-------------------------------------------------------------------------------------------------"
}

options() {
    case $1 in 
    
        # Enable 8 GB SWAP
        # Also sets swappiness to a low value so that swap is not used often
        2 | 1)
           # See Armbian Fine Tuning docs, does not seem easy, might be better to do manually 
        ;;&

        # Runs maintenance script with --auto option. Update, clean and reboot
        # Every Monday at 5AM
        # 5AM because routers reboots randomly between 2 to 5AM (cant change it)
        3 | 1)
            # OLD
            # Auto update every Monday at 5AM
            # Reboots after update, if successful
            # updandreboot="0 3 * * 1 /usr/bin/apt update && /usr/bin/apt full-upgrade -y && /sbin/shutdown -r now"
            # ( crontab -u root -l; echo "$updandreboot" ) | crontab -u root

            maintenance="0 5 * * 1 /bin/bash /root/pelochus-homelab/os/os-maintenance.sh --auto"
            ( crontab -u root -l; echo "$maintenance" ) | crontab -u root
        ;;&

        # Enables 3D HW acceleration for Orange Pi 5
        # See https://www.armbian.com/orangepi-5/
        # There is a note below download options
        # Might be unnecessary in the future or in other distros, check
        4 | 1)
            sudo add-apt-repository ppa:liujianfeng1994/panfork-mesa
            sudo add-apt-repository ppa:liujianfeng1994/rockchip-multimedia
            sudo apt update
            sudo apt dist-upgrade
            sudo apt install mali-g610-firmare rockchip-multimedia-config
        ;;

        # Exit
        5)
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
        echo "pelochus-homelab OS Config Script Help"
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
        echo "///////////////////////////////"
        echo "Finished automatic installation"
        echo "///////////////////////////////"
        echo
        exit
    fi 
fi

echo
echo "-------------------------------------------------------------------------------------------------"
echo "This is a script for auto configuring various OS parameters"
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
