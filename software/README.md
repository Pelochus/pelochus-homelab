# Software
This README focuses on the software used throughout the whole server, including installation, configuration and possible alternatives to keep an eye on.

## Pi-Hole
Installs Pi-Hole the official way with user interaction required. Needs full configuration or restoring a backup after installation.
**Uses port 80 for webUI and administration but change it to port 88 if it conflicts**

## PiVPN
Exactly the same as Pi-Hole, very similar installation and way of backing up/restoring backups. Uses either OpenVPN or Wireguard port, depending on what user selected as VPN protocol **(1194/UDP 443/TCP for OpenVPN, 51820 for WireGuard)**

## Netdata
Very lightweight way of monitoring the server, has connection to cloud for easily and securely connecting remotely to Netdata. May need compiling depending on architecture used. **Uses port 19999**

## qBittorrent
Installed qbittorrent-nox, edition without GUI but with webUI. See this [guide](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer)) for extra information in runnning and configuring the daemon. **Uses port 8080**

## Samba + SFTP
Very simple NAS-like setup. SFTP is automatically working since using OpenSSH (**uses SSH port, 22**). Samba is completely installed and configured in script, but needs minimal user interaction (folder name, username and password)

## Jellyfin
Alternative to Plex, but completely FOSS. Installation commands are from the following [guide](https://jellyfin.org/docs/general/installation/linux/#ubuntu-repository)

Compatible codecs listed [here](https://en.wikipedia.org/wiki/Comparison_of_video_container_formats). Essentially, use Chrome, Edge or native OS client.

**TODO** Maybe add Jellyfin configuration / recommended settings here?. Do once installed, configured and tested various options to see performance.

Has clients in these [platforms](https://jellyfin.org/downloads/clients/). **Uses the following ports:**
- 8096/tcp is used by default for HTTP traffic (In other words, default webUI port)
- 8920/tcp is used by default for HTTPS traffic

### ArrInstall: Install Radarr, Sonarr and other *Arr programs
This script install easily *Arr programs. **IMPORTANT It is updated manually, so everytime running it, you should be checking if there's a newer version**. See the official link in [WikiArr](https://wiki.servarr.com/install-script)

- Radarr **uses port 7878** for webUI
- Prowlarr **uses port 9696** for webUI

## Jellyseerr
Overseer fork for Jellyfin. Allows easy request of movies and shows through a cleaner, simpler web interface than Radarr / Sonarr or plain qBittorrent. Also useful because it combines both Radarr and Sonarr into one webUI. Install after Jellyfin and Arr software. **Uses port 5055**

## Minecraft
The Minecraft setup in this script is using this [guide](https://jamesachambers.com/minecraft-java-bedrock-server-together-geyser-floodgate/). See this guide for extra details in configuration and running
The main features are the following:
- Supports both Java and Bedrock players thanks to Geyser and Floodgate plugins
- Lightweight because it uses PaperMC
- Extremely easy to run thanks to Docker
- Can switch Minecraft versions pretty easily

I'm using this command to run:

```shell
docker run -it -v dockerminecraft:/minecraft -p 25565:25565 -p 19132:19132/udp -p 19132:19132 -e Version=1.20.1 -e MaxMemory=2048 -e TZ=Europe/Paris --restart unless-stopped 05jchambers/legendary-minecraft-geyser-floodgate:latest
```

Some useful files and directories are:

    PaperMC configuration:
    dockerminecraft/_data/server.properties
    
    Geyser configuration:
    dockerminecraft/_data/plugins/Geyser-Spigot/config.yml
    
    Locate Docker volume:
    docker volume inspect dockerminecraft
    
It is recommended to move the volume to an external storage if it is faster than the OS storage. Then create a symbolic link with ```ls -s``` where it was located previously so that Docker still can access the volume

**Uses port 25565 for Java and 19132 for Bedrock**

## Homarr
Web interface for organizing services. Quite stylish, simple and provides a pretty organized look for the services running in the server, at least those with some kind of web interface or access without SSH / other protocols such as SMB or VPN. Needs extra config through webUI, but is easy and simple. Substitutes Organizr, which is worse, less simple and more difficult to configure and install. **Uses port 7575, though it can be better to use 80**

Homarr can also be used as a simple Docker manager. To do this, just add ```- /var/run/docker.sock:/var/run/docker.sock``` to the ```docker-compose.yml``` volumes section

## Port List
| Software      | Port  |
| ------------- | :---: |
| Pi-Hole       | 88    |
| PiVPN         | 51820 |
| Netdata       | 19999 |
| qBittorrent   | 8080  |
| Jellyfin      | 8096  |
| Jellyseerr    | 5055  |
| Radarr        | 7878  |
| Prowlarr      | 9696  |
| MC Java       | 25565 |
| MC Bedrock    | 19132 |
| Homarr        | 7575  |

## Dynamic DNS
DynDNS is used here due to obvious reasons. I'm using NoIP because ISP's router supports it, but I would prefer to use Dynu since it doesn't require an email confirmation every 30 days, but this router doesn't support it and I don't want a DUC service in my homelab installed. 
**Note to self**: Change once I change routers, if the router supports Dynu.

## Possible alternatives
- OMV / NextCloud as an upgraded alternative to Samba + SFTP
- Grafana / Prometheus as alternatives to Netdata (way more configurable, less friendly and probably heavier on CPU/RAM/Disk)
- Deluge / Transmission as alternatives to qBittorrent

## TODO:
- Finish this README accordingly to what software has been added
