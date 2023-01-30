# Software
This README focuses on the OS and its configuration

## OS
I'm using Armbian latest version with the following "subversions" (if it can be called that):
**- Jammy:** Based on Ubuntu (Jammy) rather than Debian (Bullseye). Many people said there is better package and repositories support
**- Stable:** Better than rolling release due to obvious reasons
**- CLI image:** No plans on adding a screen, neither the current HW used has many spare power

The reason for using Armbian is **both lightweightness and support**. Orange Pi OS will probably be buggier, less updated and development will be stopped way sooner. Ubuntu Server is perhaps too heavy for a SBC, even one this powerful

## Configuration
Ordered chronologically. SSH is enabled by default on Armbian
- Update OrangePi Firmware (optional, I believe it can only be updated through OrangePi OS)
- Look for options on armbian-config
- Installed on external HDD
- SSH enabled
- SWAP enabled
- Added automatic updates (day 1 of each month) and automatic reboots (day 2 of each month)* _See TODO below_
- Open Minecraft and VPN ports (25565/both & 51820/UDP)

Only VPN port is open because WireGuard has a really low network overhead, so it is easier and more secure to just open the VPN port to connect to every other service (SSH, Pi-Hole, OMV...). Minecraft is an exception here, shouldn't give VPN profiles to every friend/family member that wants to connect to the server

## Alternatives
**- DietPi:** Even more lightweight than Armbian, also has many utilities pre-installed for ease of setup
**- Ubuntu Server:** Slightly heavy, recommended if using a proper x86 server with more RAM and CPU. Has a lot support due to being one of the most used server distros
**- Debian:** Pretty much Ubuntu but more lightweight, less preinstalled software
**- Manjaro:** Best Arch alternative

## TODO:
* Search if it is possible to do that, alternatively, make it run an update && reboot (explicitly with &&, so it doesn't reboot till update has been completed) about twice a month or once
- Change Filesystem to ZFS?
