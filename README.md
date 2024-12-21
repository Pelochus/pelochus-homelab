# pelochus-homelab V2
Personal home server configuration and automation. I use this repo as a reminder of all I did and why I did it in case I want to redo my server from the ground up in the future. This also allows me to skip some steps for future installs since I automated installations, configuration and maintenance. Made it public in case anyone wants to see my personal home server configuration as a point of reference or want to see my skills in Linux administration and DevOps. 

![ServerMainWeb](https://github.com/Pelochus/pelochus-homelab/blob/main/img/server-main-web.png)
You can see my Homarr instance here, with all the services I have. On the right, you can see my 3D printer webcam.

**In comparison to V1 (see this repo branches), V2 features:**
- Changed OS from OrangePi OS to Ubuntu Server (new Mini PC!)
- Better network organisation (using 10.0.0.0/16 address space)
- Use of Docker containers and Docker Compose instead of bare-metal installing
- Added NGINX reverse proxy + using PiHole for organising IPs into local domain names
- Used a Docker network for increased security
- Changed to Wireguard Easy
- Changed from Bash to Ansible
- Completed backups section

## More info
More info about this repo in the [wiki](https://github.com/Pelochus/pelochus-homelab/wiki). You can find:
- Hardware used
- OS used and its configuration
- Software installed and deployed
- Backups strategy
- Technical information about Ansible automation and Docker containers used

## TODO:
- Use this network config if using a cluster in the future:
  - 10.0.1.0/24 for node 1 (master?) and its Docker containers
  - 10.0.2.0/24 for node 2 and its Docker containers 
  - ...
- Think of backups automation (Rsync + Bash or Ansible)