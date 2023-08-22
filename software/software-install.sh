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
    echo "  [4] Install Netdata (could need compiling, may take a while)"
    echo "  [5] Install qBittorrent"
    echo "  [6] Install Samba (semi-automatic, requires creating user)"
    echo "  [7] Install Jellyfin & Jellyseerr"
    echo "  [8] Install Minecraft Server"
    echo "  [9] Install Homarr"
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
            sudo adduser qbtuser
            # Uncomment if not using SSH
            # sudo usermod -s /usr/sbin/nologin qbtuser 
            sudo su qbtuser
            qbittorrent-nox
            # TODO: Keep following guide, search how to do automatically the rest
        ;;&

        # Install Samba
        # Needs minimal user interaction
        6 | 1)
            sudo apt install samba samba-common-bin -y

            echo "Insert Samba Network name: "
            read sambaname
            
            echo "Insert path to be shared: "
            echo "Examples: /home/user/share /media/hdd/samba /mnt/usb/nas"
            read sharepath
            
            echo "Insert username for Samba login (user needs to exist in Linux): "
            read userlogin

            # Create and config shared folder for Samba
            mkdir /root/shared
            (echo "[$sambaname]"; \
            echo "path = $sharepath"; \
            echo "readonly = yes"; \
            echo "create mask = 0775"; \
            echo "directory mask = 0775"; \
            echo "public = no"; \
            echo "write list = $userlogin") \
            >> /etc/samba/smb.conf

            # Add user and password
            sudo smbpasswd -a $userlogin

            # Restart service and report back to user
            sudo systemctl restart smbd
            echo "||| Basic Samba installation done |||"
        ;;&

        # Install Jellyfin and Jellyseerr TODO maybe add Radarr, Sonarr and Prowlarr to this section through Arr script
        7 | 1)  
            # Prerrequisites, add repo
            sudo apt install curl gnupg
            sudo add-apt-repository universe
            sudo mkdir -p /etc/apt/keyrings
            curl -fsSL https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/jellyfin.gpg
            
            # Official way for next step:
            # cat <<EOF | sudo tee /etc/apt/sources.list.d/jellyfin.sources
            # Types: deb
            # URIs: https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release )
            # Suites: $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release )
            # Components: main
            # Architectures: $( dpkg --print-architecture )
            # Signed-By: /etc/apt/keyrings/jellyfin.gpg
            # EOF

            # My working alternative for that previous step
            echo "Types: deb
            URIs: https://repo.jellyfin.org/$( awk -F'=' '/^ID=/{ print $NF }' /etc/os-release )
            Suites: $( awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release )
            Components: main
            Architectures: $( dpkg --print-architecture )
            Signed-By: /etc/apt/keyrings/jellyfin.gpg" >> /etc/apt/sources.list.d/jellyfin.sources
            
            # Install and start
            sudo apt update
            sudo apt install jellyfin -y
            sudo systemctl enable jellyfin
            sudo systemctl restart jellyfin

            ## INSTALLATION OF JELLYSEERR
            mkdir /opt/jellyseerr/
            sudo touch /opt/jellyseerr/docker-compose.yml
            echo "version: '3'
services:
    jellyseerr:
       image: fallenbagel/jellyseerr:latest
       container_name: jellyseerr
       environment:
            - LOG_LEVEL=debug
            - TZ=Asia/Tashkent
       ports:
            - 5055:5055
       volumes:
            - /path/to/appdata/config:/app/config
       restart: unless-stopped" >> /opt/jellyseerr/docker-compose.yml
            cd /opt/jellyseerr/
            sudo apt install docker-compose -y
            docker-compose up -d
        ;;&

        # Installs Minecraft Server with Docker. Includes OpenJDK 18, PaperMC and Floodgate for Bedrock users
        # For extra info:
        # https://jamesachambers.com/minecraft-java-bedrock-server-together-geyser-floodgate/ 
        8 | 1)
            sudo apt install docker -y 
            docker volume create dockerminecraft
        ;;&

        # Install Homarr
        9 | 1)
            mkdir /opt/homarr/
            sudo touch /opt/homarr/docker-compose.yml
            echo "version: '3'
#---------------------------------------------------------------------#
#     Homarr - A simple, yet powerful dashboard for your server.     #
#---------------------------------------------------------------------#
services:
  homarr:
    container_name: homarr
    image: ghcr.io/ajnart/homarr:latest
    restart: unless-stopped
    volumes:
      - ./homarr/configs:/app/data/configs
      - ./homarr/icons:/app/public/icons
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - '7575:7575'" >> /opt/homarr/docker-compose.yml
            sudo apt install docker-compose -y # Just in case it hasnt been installed before
            cd /opt/homarr/
            docker-compose up -d
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
        echo "-a / --auto: Runs all options that don't require user's help. Needs root privileges"
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
