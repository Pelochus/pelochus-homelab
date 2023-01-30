# pelochus-homelab
Personal home server configuration and automation

## Hardware
This is the hardware used:
- Orange Pi 5 4GB
- Heatsinks + Fan + Case
- 5V4A USB-C PSU
- WD external HDD 4TB
- Network via Gigabit Ethernet

Possible alternatives/upgrades listed here [hardware/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/hardware/)

## OS
I am using Armbian as the main OS. It is lighter than the official Orange Pi OS, has more support and probably will be updated way more and longer in time. See [os/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/os/) for details in the configuration used. This includes services pre-installed in Armbian, like SSH and cron.

## Software
Here's a list of the main services/programs used. It is **approximately ordered by importance / ease of installation and, due to ease of installation, preferred order of installation**:
- Pi-Hole
- PiVPN with Wireguard
- Netdata
- qBittorrent with webUI enabled
- OpenMediaVault
- Probably will add more, but I won't add them here in this README until I actually install them properly

See [software/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/software/) for extra details of each software and their configs.

## Backups
TODO this whole section

## Guides
[Full Homeserver Guide](https://github.com/zilexa/Homeserver)
[Armbian Fine Tuning](https://docs.armbian.com/User-Guide_Fine-Tuning/)

## TODO:
- See Google Keep, once finished continue with this
- Make a list of apps/services/programs installed
- Learn automation tools different from bash scripts (Ansible?)
- Automate installations of apps/services/programs
- Automate configs
- Docker for ease of setup?
- Think of backups automation (Rsync?) 
- RAID1 in the future?
