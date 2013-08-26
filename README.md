# ec2-consistent-snapshot cookbook
A cookbook to install https://github.com/alestic/ec2-consistent-snapshot on both Ubuntu and Cent Os

# Requirements
GRANT RELOAD, REPLICATION CLIENT, SUPER ON *.* TO  'snapshotter'@'localhost' IDENTIFIED BY 'password';

# Usage

export CHEF_JSON='{"ec2-consistent-snapshot": {"aws_access_key_id": "someid","aws_secret_access_key": "somekey"}}'

echo $CHEF_JSON > /tmp/chef.json
chef-client -j /tmp/chef.json -o 'recipe[ec2-consistent-snapshot::default]' -j /tmp/chef.json

ec2-consistent-snapshot --mysql --mysql-socket /tmp/mysql.sock --freeze-filesystem /vol --region us-east-1 --aws-credentials-file /root/.awssecret --mysql-master-status-file /prepudb/mysql_status --mysql-host localhost --mysql-username snapshotter --mysql-password password --description "Prod Slave 0 dailey snapshot $(date +'%Y-%m-%d %H:%M:%S')" vol-xxxxxxx


# Attributes
see attributes folder

# Recipes
ec2-consistent-snapshot::default

# Author

Author:: Patrick H. McJury (<patrick.mcjury@macmillan.com>)

Forked originally from https://github.com/outright/chef-ec2-consistent-snapshotoutright
