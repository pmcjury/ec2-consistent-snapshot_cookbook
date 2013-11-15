# ec2-consistent-snapshot cookbook

A cookbook to install <https://github.com/alestic/ec2-consistent-snapshot> on both Ubuntu and Centos. 

For Ubuntu we just leverage the apt repo.

For Centos we have to install the dependencies via yum and download the script from the github repo.

# Requirements

```GRANT RELOAD, REPLICATION CLIENT, SUPER ON *.* TO  'username'@'localhost' IDENTIFIED BY 'password';```

# Usage

To just install the ec2-consistent-snapshot script use:

```include_recipe 'ec2-consistent-snapshot::default'```

To install a cron job to run the script use:

```include_recipe 'ec2-consistent-snapshot::cron'```

# Attributes

* ```['ec2-consistent-snapshot']['aws_access_key_id']     = nil``` - aws id key
* ```['ec2-consistent-snapshot']['aws_secret_access_key'] = nil``` - aws secret key 
* ```['ec2-consistent-snapshot']['aws_file'] = '/root/.awssecret'``` - the location of the file to store aws credentials
* ```['ec2-consistent-snapshot']['aws_template'] = 'awssecret.erb'``` - the template location to generate the aws credentials file
* ```['ec2-consistent-snapshot']['filesystem'] = 'ext4'``` - the file system type to use when running the script. xfs require the xfs chef recipe to install its tools that the script uses
* ```['ec2-consistent-snapshot']['user'] = 'root'``` - user that owns the script
* ```['ec2-consistent-snapshot']['group'] = 'root'``` - grou that the script belongs

## cron 

These correspond to the cron job used in the cron recipe which leverage the cron_d lwrp from <http://community.opscode.com/cookbooks/cron>

* ```['ec2-consistent-snapshot']['cron']['name'] = 'ec2-consistent-snapshot'``` - the name of the cron.d file
* ```['ec2-consistent-snapshot']['cron']['minute'] = 33``` - the cron expression minute
* ```['ec2-consistent-snapshot']['cron']['hour'] = 3``` - the cron expression hour
* ```['ec2-consistent-snapshot']['cron']['path'] = '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin'``` - the cron.d PATH
* ```['ec2-consistent-snapshot']['cron']['mailto'] = nil``` - the mailto for the cron.d file

## rhel specific
 
  * ```['ec2-consistent-snapshot']['file'] = '/usr/local/bin/ec2-consistent-snapshot'``` - the ec2-consistent-snapshot script location
  * ```['ec2-consistent-snapshot']['src'] = 'https://raw.github.com/alestic/ec2-consistent-snapshot/master/ec2-consistent-snapshot'``` -- the url to get the script from
  * ```['ec2-consistent-snapshot']['checksum'] = 'cd401d2e1aedf7c9d390e4bc50c08b7cebc631e709a9677c146800c06d42069a'``` - the checksum of the file
  * ```['ec2-consistent-snapshot']['pkgs'] = %w{
    perl-Net-Amazon-EC2 perl-File-Slurp perl-DBI perl-DBD-MySQL perl-Net-SSLeay perl-IO-Socket-SSL perl-Time-HiRes
    perl-DateTime perl-Params-Validate
  }``` - the pkgs needed to run the script on rhel
## ubuntu specific
 
  * ```['ec2-consistent-snapshot']['repo_uri'] = 'http://ppa.launchpad.net/alestic/ppa/ubuntu'``` - the apt repo uri
  * ```['ec2-consistent-snapshot']['repo'] = 'ppa:alestic'``` - the apt repo
  * ```['ec2-consistent-snapshot']['keyserver'] = 'BE09C571'``` - the apt keyserver
  * ```['ec2-consistent-snapshot']['component'] = 'precise'``` the apt component
  * ```['ec2-consistent-snapshot']['pkgs'] = %w{ec2-consistent-snapshot}``` - the package


## lwrp attributes

### ec2_consistent_snapshot_script 

These correspond to the options on the command line for ec2-consistent-snapshot

* ```['ec2-consistent-snapshot']['script']['name'] = '/usr/local/bin/ebs-snapshot'``` - the name of the script
* ```['ec2-consistent-snapshot']['script']['mysql'] = true``` - to use mysql
* ```['ec2-consistent-snapshot']['script']['mysql_socket'] = nil``` - connect via socket
* ```['ec2-consistent-snapshot']['script']['freeze_filesystem'] = []``` - the mount/volume/directory to freeze
* ```['ec2-consistent-snapshot']['script']['aws_credentials_file'] = '/root/.awssecret'``` -  the crednetials files for aws
* ```['ec2-consistent-snapshot']['script']['mysql_master_status_file'] = nil``` - the location of the master fiel used for replicaiton bin location/status
* ```['ec2-consistent-snapshot']['script']['mysql_host'] = 'localhost'``` - the mysql host
* ```['ec2-consistent-snapshot']['script']['mysql_username'] = nil``` - the mysql user
* ```['ec2-consistent-snapshot']['script']['mysql_password'] = nil``` - the mysql pwd
* ```['ec2-consistent-snapshot']['script']['description'] = 'Dailey snapshot'``` a description to give to the snapshot
* ```['ec2-consistent-snapshot']['script']['volumes'] = []``` - the ec2 volume to snapshot

# Recipes

```
ec2-consistent-snapshot::default
ec2-consistent-snapshot::cron
```

# LWRPs

## ec2_consistent_snapshot_script

The cookbook contains one provider to create a script which calls the script with it's options. The lwrp lets you do it through attributes since there are so many options. 

The script will generate a script like:

```
#!/usr/bin/env bash
# MyScript Created on Jan 1st, 1970 00:00:00 and managed by Chef. Changes will be overwritten on next run
/usr/local/bin/ec2-consistent-snapshot --mysql --mysql-socket /tmp/mysql.sock --freeze-filesystem /vol --region us-east-1 --aws-credentials-file /root/.awssecret --mysql-master-status-file /vol/mysql_status --mysql-host localhost --mysql-username snapshotter --mysql-password password --description "dailey snapshot $(date +'%Y-%m-%d %H:%M:%S')" vol-xxxxxxx
```

# Author

Author:: Patrick H. McJury (<patrick.mcjury@macmillan.com>)

Forked originally from https://github.com/outright/chef-ec2-consistent-snapshotoutright
