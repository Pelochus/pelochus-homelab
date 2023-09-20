# Ansible
This README serves as a short explanation of the Ansible configuration for this server

## Playbooks
My server has 4 main playbooks:
- **os-config.yml:** Setups some basic Linux configuration for the first time, like aliases and crontab
- **software-deploy.yml:** Installs essential packages and deploys my Docker containers, which contain my main services used
- **os-maintenance.yml:** Updates and cleans the system. Runs automatically once a week
- **backup.yml:** Backups some configuration files (from services like PiVPN) and important files

These first two playbooks are made to be run once after installing Ansible on a fresh OS install. Right now, only ```Debian/Ubuntu``` distros are supported due to use of ```apt```.

## Roles
There are 4 roles, one for each playbook, but some of the tasks of these roles are shared like updating and cleaning the system after installing the main software used.

Each role is properly divided with different tasks files, templates, handlers, defaults...

## Inventories
Only using one simple ```hosts``` files right now for the localhost. Will be updated for a future cluster setup.

## More info
- ```ansible.cfg``` has ```pipelining``` set to ```true``` and default inventory set up to ```hosts```
- Added a ```requirements.yml``` file. Run with ```ansible-galaxy install -r requirements.yml```