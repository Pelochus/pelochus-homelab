# V1
This branch represents the status of my homelab before doing the TODO at the bottom of this README.

V1 features the use of bash, services installed directly on the OS and not too many backups

For V2, I will try to substitute bash for Ansible (at least partially), use Docker/Docker-Compose whenever possible, do some backup automation and better organise the network with changed private addressing from 192.168.0.0/24 to 10.0.0.0/16 + reverse proxy or better DNS config.  

# pelochus-homelab
Personal home server configuration and automation. I use this repo as a reminder of all I did and why I did it in case I want to redo my server from the ground up in the future. This also allows me to skip some steps for future installs since I automated installations, configuration and maintenance. Made it public in case anyone wants to see my personal home server configuration as a point of reference or want to see my skills in Linux administration and scripting. 

## Hardware
This is the hardware used:
- Orange Pi 5 4GB
- Heatsinks + Fan + Case
- 5V4A USB-C PSU
- WD external HDD 4TB
- Network via Gigabit Ethernet

Possible alternatives/upgrades listed here [hardware/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/hardware/)

## OS
I am using Armbian as the main OS. It is lighter than the official Orange Pi OS, has more support and probably will be updated way more and longer in time. See [os/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/os/) for details in the configuration used. This includes services pre-installed in Armbian, like SSH and cron. Also includes some basic system & software maintenance.

## Software
Here's a list of the main services/programs used. It is **approximately ordered by importance / ease of installation and, due to ease of installation, preferred order of installation**:
- Pi-Hole
- PiVPN with Wireguard
- Netdata
- qBittorrent with webUI enabled
- Samba + SFTP (Simple NAS setup)
- Jellyfin + *Arr Software + Jellyseer
- Minecraft Server with Geyser
- Homarr (substitutes Organizr)

See [software/README.md](https://github.com/Pelochus/pelochus-homelab/edit/main/software/) for extra details of each software and their configs.

## Backups
TODO this whole section

## Guides
Guides I used for building this server:

[Full Homeserver Guide](https://github.com/zilexa/Homeserver)

[Armbian Fine Tuning](https://docs.armbian.com/User-Guide_Fine-Tuning/)

[qBittorrent with webUI + daemon](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer))

[Jellyfin Ubuntu Installation](https://jellyfin.org/docs/general/installation/linux/#ubuntu-repository)

[WikiArr for *Arr Installations](https://wiki.servarr.com/)

[Minecraft Server in Docker with Bedrock support](https://jamesachambers.com/minecraft-java-bedrock-server-together-geyser-floodgate/)

[OpenMediaVault Installation](https://docs.openmediavault.org/en/latest/installation/on_debian.html)
*Requires Debian or Debian-based distro, shouldn't use Ubuntu*

## TODO:
- Use nginx as a reverse proxy
  - Configure SSL with Lets Encrypt, allowing for secure connection to the proxy and all its subsequent subdomains 
  - This also allows to assign a subdomains names like: ```pihole.node1.local```, ```jellyfin.node2.local```...
- Use this network config when migrating to Docker
  - Use 10.0.0.0/16 private addressing, for simplicity. For example, 10.0.0.0/8 reserved for DHCP devices (smartphones, tablets, IoT...), 10.0.1.0/8 for Docker containers in node 1 (assuming future configuration of cluster)...
  - Once every service has its own container and IP, change the network accordingly (subnetting?)
  - Assign a local hostname to each service IP (for example, pi.hole, jellyfin.local, radarr.local, netdata.local...)
- Use Docker containers more often, especially when:
    - Install does not need initial config (like Pi-Hole, PiVPN)
    - Other install methods are difficult or Docker is the recommended one
    - Do not mind performance overhead
    - Easy startup on boot with ```--restart unless-stopped``` flag
    - Best examples here are: Homarr, Jellyfin, Jellyseer, MC server...
- Investigate Watchtower for easy updating of Docker installed containers via Docker Compose
  - _Note: It is possible that this has been added natively to Docker Compose, research if it is better than Watchtower_
- Learn automation/config tools different from bash scripts (Ansible mainly)
- Think of backups automation (Rsync + Bash or Ansible)
