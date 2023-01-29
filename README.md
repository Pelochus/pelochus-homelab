# pelochus-homelab
Personal home server configuration and automation

## Hardware
This is the hardware used:
- Orange Pi 5 4GB
- Heatsinks + Fan + Case
- 5V4A USB-C PSU
- WD external HDD 4TB

Possible alternatives/upgrades listed here [hardware/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/hardware/README.md) 

## OS
I am using Armbian as the main OS. It is lighter than the official Orange Pi OS, has more support and probably will be updated way more and longer in time. See [os/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/os/README.md) for details in the configuration used. This includes services pre-installed in Armbian, like SSH and cron.

## Software
Here's a list of the main services/programs used. It is **approximately ordered by importance / ease of installation and, due to ease of installation, preferred order of installation**:
- Pi-Hole
- PiVPN with Wireguard
- Netdata
- qBittorrent with webUI enabled
- OpenMediaVault
- Probably will add more, but I won't add them here in this README until I actually install them properly

See [software/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/software/README.md) for extra details of each software and their configs.

# NOTE: Copy these two sections to software readme  
### Dynamic DNS
DynDNS is used here due to obvious reasons. I'm using NoIP because ISP's router supports it, but I would prefer to use Dynu since it doesn't require an email confirmation every 30 days, but this router doesn't support it and I don't want a DUC service in my homelab installed. 
**Note to self**: Change once I change routers, if the router supports Dynu.

### Possible alternatives
- FileRun / Nextcloud as an alternative to OMV
- Grafana / Prometheus as alternatives to Netdata (way more configurable, less friendly and probably heavier on CPU/RAM/Disk)
- Deluge / Transmission as alternatives to qBittorrent

## Backups
TODO this whole section

## TODO:
- See Google Keep, once finished continue with this
- Make a list of apps/services/programs installed
- Learn automation tools different from bash scripts (Ansible?)
- Automate installations of apps/services/programs
- Automate configs
- Docker for ease of setup?
- Think of backups automation (Rsync?) 
- RAID1 in the future?
