# Software
This README focuses on the software used throughout the whole server, including installation, configuration and possible alternatives to keep an eye on.

## Pi-Hole


## PiVPN


## Netdata


## qBittorrent
See this [guide](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer))

## OpenMediaVault


## Dynamic DNS
DynDNS is used here due to obvious reasons. I'm using NoIP because ISP's router supports it, but I would prefer to use Dynu since it doesn't require an email confirmation every 30 days, but this router doesn't support it and I don't want a DUC service in my homelab installed. 
**Note to self**: Change once I change routers, if the router supports Dynu.

## Possible alternatives
- FileRun / Nextcloud as an alternative to OMV
- Grafana / Prometheus as alternatives to Netdata (way more configurable, less friendly and probably heavier on CPU/RAM/Disk)
- Deluge / Transmission as alternatives to qBittorrent

## TODO:
- Install more software, mainly media software and Organizr
- Finish this readme accordingly to what software has been added
