# Hardware
This README focuses on the hardware used and possible future add-ons/upgrades. Also includes network configuration and structure

## Computer Specs
Orange Pi 5 with the following specs:
- **Rockchip RK3588S:** Powerful enough for running Genshin Impact on Android, approximately equivalent to SD855. Enough for one or two heavy software or many lightweight programs
- **4GB RAM**
- **Added heatsinks and fan**
- **M.2 NVMe expansion possibility:** Uses PCIe 2.0x1, up to 500 MB/s. Compatible with 2242 and 2230 SSDs. Also compatible with eMMC and SATA SSDs (this one needs extra configuration)

## Storage
- **WD External HDD 4TB:** Used for the whole OS and data
- **Filesystem:** OS default, ext4

## Networking
Using **10.0.0.0/16** for private IP addressing because it is cleaner looking than 192.168.0.0. The net is divided this way:
- 10.0.0.0/8 for DHCP and router
- 10.0.1.0/8 for this server
  - TODO: Once using Docker, assign a different IP to each container in this range
- 10.0.2.0/8 for a Raspberry Pi I have controlling my 3D printer

## Future upgrades
- Add more disk space
- RAID configuration (Better do on a true server, not on an Orange Pi...)
- Change filesystem to ZFS or something more suitable for a server

## TODO:
- Look up more possible ugprades, especially for Orange Pi 5
- Make physical installation cool, with proper cable management and some decorations, like ambient lighting (remember RPi 4 cluster with liquid refrigeration on a wall?)
