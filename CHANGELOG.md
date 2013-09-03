# ec2-consistent-snapshot_cookbook

## 0.1.1

New:
* added attributes for cron command

Changes:
* removed LWRP ( making a new one in the future )
=======
* added lwrp script to generate a script of the ec2-consistent-snapshot command with all options. Use in in conjuneciton with cron_d lwrp in the ec2-consistent-snapshot::cron recipe
* added attributes for lwrp
* added tests for new lwrp script
* added cron recipe and attributes

Changes:
* renamed lwrp to more appropriate name

## 0.1.0

New:

* added chefspec
* added minitest
* added foodcritic
* added strainer
* added berkshelf
* added test kitchen
* enabled support for ubuntu 12.04
* enabled support for centos 6.4

Fixes

* fixed meta data to be correct by giving it a name
* only install xfs if an attribute is set
* changed all hardcoded values to attributes

Changes

* renamed LWRP to same as cookbook 