# Backups
This section includes what backups are needed, which are recommended and how to backup if it isn't possible via scripts/terminal

## Full OS backup
Researching

## Important data
TODO:
- Make script
- Select what data needs to be copied
- Use rsync mainly

## Software configuration
Some installed services have the ability to backup their data. These are listed here:

| Software    | Backup Type |
| ----------- | ----------- |
| Pi-Hole     | Can backup through web interface |
| PiVPN       | Command line backup, ```pivpn -bk``` |
| Netdata     | Cloud based backup, linked to account |
| qBittorrent | Not needed |
| Jelly*      | Not needed (except for local media) |
| Minecraft   | Manually copy world data. There are also automatic backups |
| *Arr        | Option in webUI, similar to Pi-Hole |
| Homarr      | webUI option, similar to Pi-Hole |

## TODO:
- Scripts for automating backups
- Search up if it is possible to automate the majority of the backups listed above, via terminal or copying from an existing directory
