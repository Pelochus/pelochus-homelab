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
[Full Homeserver Guide](https://github.com/zilexa/Homeserver)

[Armbian Fine Tuning](https://docs.armbian.com/User-Guide_Fine-Tuning/)

[qBittorrent with webUI + daemon](https://github.com/qbittorrent/qBittorrent/wiki/Running-qBittorrent-without-X-server-(WebUI-only,-systemd-service-set-up,-Ubuntu-15.04-or-newer))

[Jellyfin Ubuntu Installation](https://jellyfin.org/docs/general/installation/linux/#ubuntu-repository)

[WikiArr for *Arr Installations](https://wiki.servarr.com/)

[Minecraft Server in Docker with Bedrock support](https://jamesachambers.com/minecraft-java-bedrock-server-together-geyser-floodgate/)

[OpenMediaVault Installation](https://docs.openmediavault.org/en/latest/installation/on_debian.html)
*Requires Debian or Debian-based distro, shouldn't use Ubuntu*

## TODO:
- Learn automation tools different from bash scripts (Ansible)
- Learn Docker, helps at isolating programs, assigning different IPs per container, restoring to an initial point if something breaks badly...
- Investigate Watchtower for easy updating of Docker installed containers via Docker Compose
- Use Docker containers more often, especially when:
    - Install does not need initial config (like Pi-Hole, PiVPN)
    - Other install methods are difficult or Docker is the recommended one
    - Do not mind performance overhead
    - Easy startup on boot with ```--restart unless-stopped``` flag
    - Best examples here are: Homarr, Jellyfin, Jellyseer, MC server...
- Think of backups automation (Rsync + Bash or Ansible)
