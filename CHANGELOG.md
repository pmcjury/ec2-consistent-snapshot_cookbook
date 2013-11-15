ec2-consistent-snapshot_cookbook CHANGELOG
===============

v0.1.5
------
### Fixes
- Fixed path in template file for ec2-consistent snapshot. Gave it an absolute path. I could have just set path in cron. It may be more portable

v0.1.4
------
### Fixes
- fixed mysql_username in cron recipe
- fixed description to include bash timestamp in template
- added mailto to crontab

v0.1.3
------

### Fixes
- removed unknown option mysql-port

v0.1.2
------

### Fixes
- added a slash after the description option when generating the script fomr the LWRP

v0.1.1
------

### New
- added LWRP script to generate a script of the ec2-consistent-snapshot command with all options. Use in in conjuneciton with cron_d LWRP in the ec2-consistent-snapshotcron recipe
- added attributes for cron command
- added tests for new LWRP script
- added cron recipe and attributes
- added attributes for LWRP

### Changes
- removed old LWRP 

v0.1.0
------

### New

- added chefspec
- added minitest
- added foodcritic
- added strainer
- added berkshelf
- added test kitchen
- enabled support for ubuntu 12.04
- enabled support for centos 6.4

### Fixes

- fixed meta data to be correct by giving it a name
- only install xfs if an attribute is set
- changed all hardcoded values to attributes

### Changes

- renamed LWRP to same as cookbook 