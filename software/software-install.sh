#!/bin/bash
#
# Title: software-install.sh
# Author: Pelochus
# Version: 1.0
# Brief: Installs software for my server and, if possible, configures the basics

#############
### Functions
#############

menu() {
    echo "-------------------------------------------------------------------------------------------------"
    echo 
    echo "  ### MENU - Choose an option"
    echo 
    echo "  [1] Do everything"
    echo "  [2] Install Pi-Hole (needs user interaction)"
    echo "  [3] Install PiVPN (needs user interaction)"
    echo "  [4] Install Netdata (needs compiling, may take a while)"
    echo "  [5] Install qBittorrent"
    echo "  [6] Install Samba (semi-automatic, requires creating user)"
    echo "  [7] Install Jellyfin"
    echo "  [8] Install Minecraft Server"
    echo "  [9] Install Organizr (needs user interaction)"
    echo "  [0] Exit"
    echo 
    echo "-------------------------------------------------------------------------------------------------"
}

options() {
    case $1 in 
    
        # Install Pi-Hole, needs user interaction, must be done before PiVPN
        # Configuration is manual, restore a backup or do manually in webUI
        2 | 1)
            curl -sSL https://install.pi-hole.net | bash
        ;;& 

        # Install PiVPN, also needs user interaction
        3 | 1)
            curl -L https://install.pivpn.io | bash
        ;;&

        # Install Netdata, needs compiling, may take a while
        4 | 1)
            wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && \
            sh /tmp/netdata-kickstart.sh --stable-channel --disable-telemetry
        ;;&

        # Install qBittorrent-nox, which is a CLI edition with webUI
        5 | 1)
            sudo apt install qbittorrent-nox -y
            # TODO: Config daemon? Maybe not possible, due to necessary first run with required user's input 
        ;;&

        # Install Samba
        # Needs minimal user interaction
        6 | 1)
            sudo apt install samba samba-common-bin -y

            echo "Insert Samba Network name: "
            read sambaname

            # Create and config shared folder for Samba
            mkdir /root/shared
            (echo "[$sambaname]"; \
            echo "path = /root/shared"; \
            echo "writeable=Yes"; \
            echo "create mask=0777"; \
            echo "directory mask=0777" \
            echo "public=no") \
            >> /etc/samba/smb.conf

            # Add user + password
            echo "Insert username for Samba login (user needs to exist in Linux): "
            read userlogin
            sudo smbpasswd -a $userlogin

            # Restart service and report back to user
            sudo systemctl restart smbd
            echo "||| Basic Samba installation done |||"
        ;;&

        # TODO Install Jellyfin [maybe add Radarr, Sonarr and Prowlarr to this section]
        7 | 1)
            
        ;;&

        # Installs Minecraft Server with Docker. Includes OpenJDK 18, PaperMC and Floodgate for Bedrock users
        # For extra info:
        # https://jamesachambers.com/minecraft-java-bedrock-server-together-geyser-floodgate/ 
        8 | 1)
            sudo apt install docker -y 
            docker volume create dockerminecraft
        ;;&

        # TODO Install Organizr [NOTE: May also conflict with PiHole port 80, better change PiHole in this case]
        # NOTE Also needs user interaction, 
        9 | 1)
            sudo git clone https://github.com/elmerfdz/OrganizrInstaller /opt/OrganizrInstaller
            sudo bash /opt/OrganizrInstaller/ubuntu/oui/ou_installer.sh
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
        echo "pelochus-homelab Software Installation Script Help"
        echo
        echo "-a / --auto: Runs all options that doesn't require user's help. Needs root privileges"
        echo "-h / --help: Shows this help screen"
        echo 
        echo "For more information visit https://github.com/Pelochus/pelochus-homelab/software"
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
echo "This is a script for automating installation and configuration of various softwares for my server"
echo "The script needs root privileges since it uses apt"
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