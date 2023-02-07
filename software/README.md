# Software
This README focuses on the software used throughout the whole server, including installation, configuration and possible alternatives to keep an eye on.

## Pi-Hole
Installs Pi-Hole the official way with user interaction required. Needs full configuration or restoring a backup after installation.
**Uses port 80 for webUI and administration**

## PiVPN
Exactly the same as Pi-Hole, very similar installation and way of backing up/restoring backups. Uses either OpenVPN or Wireguard port, depending on what user selected as VPN protocol **(1194/UDP 443/TCP for OpenVPN, 51820 for WireGuard)**

## Netdata
Very lightweight way of monitoring the server, has connection to cloud for easily and securely connecting remotely to Netdata. Needs compiling, but no user interaction, so it will take some time. **Uses port 19999**

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

## Minecraft
The Minecraft setup in this script is using this [guide](https://jamesachambers.com/minecraft-java-bedrock-server-together-geyser-floodgate/). See this guide for extra details in configuration and running
The main features are the following:
- Supports both Java and Bedrock players thanks to Geyser and Floodgate plugins
- Lightweight because it uses PaperMC
- Extremely easy to run thanks to Docker
- Can switch Minecraft versions pretty easily

I'm using this command to run:

```shell
    docker run -it -v dockerminecraft:/minecraft -p 25565:25565 -p 19132:19132/udp -p 19132:19132 -e Version=1.19.3 MaxMemory=2048 TZ=Europe/Paris --restart unless-stopped 05jchambers/legendary-minecraft-geyser-floodgate:latest
```
**Uses port 25565 for Java and 19132 for Bedrock**

## Organizr
Web interface for organizing services. Quite stylish, simple and provides a pretty organized look for the services running in the server, at least those with some kind of web interface or access without SSH / other protocols such as SMB or VPN. Like Pi-Hole, **uses port 80**

### TODO
Since ports conflict, see if by any chance this theory works:
pi.hole/admin redirects to PiHole webUI
pi.hole       redirects to Organizr

If that doesn't work, you have these two alternatives:
- Change PiHole port (I want Organizr as the main/start page)
- Use PiHole or Organizr in a Docker image or something that lets me give it an extra IP (everything has the same local IP except that Docker Image)

## Dynamic DNS
DynDNS is used here due to obvious reasons. I'm using NoIP because ISP's router supports it, but I would prefer to use Dynu since it doesn't require an email confirmation every 30 days, but this router doesn't support it and I don't want a DUC service in my homelab installed. 
**Note to self**: Change once I change routers, if the router supports Dynu.

## Possible alternatives
- OMV / NextCloud as an upgraded alternative to Samba + SFTP
- Grafana / Prometheus as alternatives to Netdata (way more configurable, less friendly and probably heavier on CPU/RAM/Disk)
- Deluge / Transmission as alternatives to qBittorrent

## TODO:
- Install more software, mainly media software and Organizr
- Finish this readme accordingly to what software has been added
