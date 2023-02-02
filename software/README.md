# Software
This README focuses on the software used throughout the whole server, including installation, configuration and possible alternatives to keep an eye on.

## Pi-Hole


## PiVPN


## Netdata


## qBittorrent
See this [guide](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer))

## Samba + SFTP

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
