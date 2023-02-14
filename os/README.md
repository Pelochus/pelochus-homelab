# Operating System
This README focuses on the OS and its configuration

## OS
I'm using Armbian latest version with the following "subversions" (if it can be called that):
- **Jammy:** Based on Ubuntu rather than Debian (Bullseye). HW accelerated playback is easier in Jammy. Many people say there is better support and more packages in Jammy, but OpenMediaVault only works in Debian based distros (Ubuntu doesn't, for some reason) and this is why I'm just running a simple SFTP + Samba for the NAS part of the server
- **Stable:** Better than rolling release due to obvious reasons
- **CLI image:** No plans on adding a screen, neither the current HW used has many spare power

The reason for using Armbian is **both lightness and support**. Orange Pi OS will probably be buggier, less updated and development will be stopped way sooner. Ubuntu Server is perhaps too heavy for a SBC, even one this powerful

## Configuration
Ordered chronologically. SSH is enabled by default on Armbian
- Update OrangePi Firmware (optional, I believe it can only be updated through OrangePi OS)
- Looked for useful options on armbian-config and changed them if considered useful/important
- Installed on external HDD
- SSH enabled
- SWAP enabled (especifically, [ZSWAP](https://docs.armbian.com/User-Guide_Fine-Tuning/#swap-for-experts) on Armbian)
- Run basic options from maintenance script automatically, every Monday at 5AM
- Open VPN Wireguard port (51820/UDP)
- Open Minecraft and VPN ports (25565/both & 19132/UDP)
- Enable 3D HW acceleration (Optional, See [this](https://www.armbian.com/orangepi-5/))
- (Optional) If using an external storage, add entry to /etc/fstab. Mount in /media/hdd or /media/ssd or whatever type of storage is.

Only VPN port is open because WireGuard has a really low network overhead, so it is easier and more secure to just open the VPN port to connect to every other service (SSH, Pi-Hole, NAS...). Minecraft is an exception here, shouldn't give VPN profiles to every friend/family member that wants to connect to the server

## Maintenance
Since any SBC is simple enough to not need any hardware maintenance (apart from replacing broken parts), I added this section here in OS, which is the only section that needs frequent maintenance. There is a specific [script](https://github.com/Pelochus/pelochus-homelab/os/os-maintenance.sh) for maintenance which does the following:
- **Update && clean:** Runs apt looking to update software and calls apt autoclean afterwards
- **Pi-Hole Update:** Runs pihole -up in order to update Pi-Hole adlists
- **Remove APT cache && unnecessary dependencies:** Runs apt clean, which removes all cache for apt and autoremove for unnecessary dependencies
- **Reboot:** This option is there only for chaining with the previous options when doing an automatic maintenance
- **TODO:** Defrag? (could be dangerous without backup power), Full cache clean? Remove logs older than 1 month?

This maintenance script uses **apt full-upgrade** (same as apt-get dist-upgrade) instead of upgrade. See main difference [here](https://askubuntu.com/questions/194651/why-use-apt-get-upgrade-instead-of-apt-get-dist-upgrade)

## Alternatives
Here are some OS alternatives:
- **DietPi:** Even more lightweight than Armbian, also has many utilities pre-installed for ease of setup
- **Ubuntu Server:** Slightly heavy, recommended if using a proper x86 server with more RAM and CPU. Has a lot support due to being one of the most used server distros
- **Debian:** Pretty much Ubuntu but more lightweight, less preinstalled software. OpenMediaVault officially supported
- **Manjaro:** Best Arch alternative

## TODO:
- Change Filesystem to ZFS/BTRFS?
- Investigate MergerFS and SnapRAID (future builds with proper server HW and storage)
