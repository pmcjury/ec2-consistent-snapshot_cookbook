# ec2-consistent-snapshot cookbook
A cookbook to install https://github.com/alestic/ec2-consistent-snapshot on both Ubuntu and Cent Os

# Requirements
GRANT RELOAD, REPLICATION CLIENT, SUPER ON *.* TO  'snapshotter'@'localhost' IDENTIFIED BY 'password';

# Usage

export CHEF_JSON='{"ec2-consistent-snapshot": {"aws_access_key_id": "nil","aws_secret_access_key": "nil/+b"}}'

echo $CHEF_JSON > /tmp/chef.json
chef-client -j /tmp/chef.json -o 'recipe[ec2-consistent-snapshot::default]' -j /tmp/chef.json

ec2-consistent-snapshot --mysql --mysql-socket /tmp/mysql.sock --freeze-filesystem /prepudb --region us-east-1 --aws-credentials-file /root/.awssecret --mysql-master-status-file /prepudb/mysql_status --mysql-host localhost --mysql-username snapshotter --mysql-password ec2sn@pSh@tter --description "Prod Slave 0 dailey snapshot $(date +'%Y-%m-%d %H:%M:%S')" vol-xxxxxxx


# Attributes

# Recipes

# Author

Author:: Patrick H. McJury (<patrick.mcjury@macmillan.com>)

Forked originally from (outright/chef-ec2-consistent-snapshot)[outright/chef-ec2-consistent-snapshot]
