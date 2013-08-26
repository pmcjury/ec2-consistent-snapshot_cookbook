# ec2-consistent-snapshot cookbook

# Requirements
GRANT RELOAD, REPLICATION CLIENT, SUPER ON *.* TO  'snapshotter'@'localhost' IDENTIFIED BY 'ec2sn@pSh@tter';

# Usage

export CHEF_JSON='{"ec2-consistent-snapshot": {"aws_access_key_id": "AKIAIPQQEZQ5BVLXGO5Q","aws_secret_access_key": "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"}}'

echo $CHEF_JSON > /tmp/chef.json
chef-client -j /tmp/chef.json -o 'recipe[ec2-consistent-snapshot::default]' -j /tmp/chef.json

ec2-consistent-snapshot --mysql --mysql-socket /tmp/mysql.sock --freeze-filesystem /prepudb --region us-east-1 --aws-credentials-file /root/.awssecret --mysql-master-status-file /prepudb/mysql_status --mysql-host localhost --mysql-username snapshotter --mysql-password ec2sn@pSh@tter --description "ProdSlave0 dailey snapshot $(date +'%Y-%m-%d %H:%M:%S')" vol-bbfde1e1


# Attributes

# Recipes

# Author

Author:: Patrick H. McJury (<patrick.mcjury@macmillan.com>)
