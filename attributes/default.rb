default['ec2-consistent-snapshot']['aws_access_key_id']     = nil
default['ec2-consistent-snapshot']['aws_secret_access_key'] = nil
default['ec2-consistent-snapshot']['aws_file'] = '/root/.awssecret'
default['ec2-consistent-snapshot']['aws_template'] = 'awssecret.erb'

default['ec2-consistent-snapshot']['filesystem'] = 'ext4'

default['ec2-consistent-snapshot']['user'] = 'root'
default['ec2-consistent-snapshot']['group'] = 'root'

case platform_family
when 'rhel'
  default['ec2-consistent-snapshot']['file'] = '/usr/local/bin/ec2-consistent-snapshot'
  default['ec2-consistent-snapshot']['src'] = 'https://raw.github.com/alestic/ec2-consistent-snapshot/master/ec2-consistent-snapshot'
  default['ec2-consistent-snapshot']['checksum'] = 'cd401d2e1aedf7c9d390e4bc50c08b7cebc631e709a9677c146800c06d42069a'
  default['ec2-consistent-snapshot']['pkgs'] = %w{
    perl-Net-Amazon-EC2 perl-File-Slurp perl-DBI perl-DBD-MySQL perl-Net-SSLeay perl-IO-Socket-SSL perl-Time-HiRes
    perl-DateTime perl-Params-Validate
  }
else
  default['ec2-consistent-snapshot']['repo_uri'] = 'http://ppa.launchpad.net/alestic/ppa/ubuntu'
  default['ec2-consistent-snapshot']['repo'] = 'ppa:alestic'
  default['ec2-consistent-snapshot']['keyserver'] = 'BE09C571'
  default['ec2-consistent-snapshot']['component'] = 'precise'
  default['ec2-consistent-snapshot']['pkgs'] = %w{ec2-consistent-snapshot}
end
default['ec2-consistent-snapshot']['script']['name'] = '/usr/local/bin/ebs-snapshot'
default['ec2-consistent-snapshot']['script']['mysql'] = true
default['ec2-consistent-snapshot']['script']['mysql_socket'] = nil
default['ec2-consistent-snapshot']['script']['freeze_filesystem'] = []
default['ec2-consistent-snapshot']['script']['aws_credentials_file'] = '/root/.awssecret'
default['ec2-consistent-snapshot']['script']['mysql_master_status_file'] = nil
default['ec2-consistent-snapshot']['script']['mysql_host'] = 'localhost'
default['ec2-consistent-snapshot']['script']['mysql_username'] = nil
default['ec2-consistent-snapshot']['script']['mysql_password'] = nil
default['ec2-consistent-snapshot']['script']['description'] = 'dailey snapshot'
default['ec2-consistent-snapshot']['script']['volumes'] = []

default['ec2-consistent-snapshot']['cron']['name'] = 'ec2-consistent-snapshot'
default['ec2-consistent-snapshot']['cron']['minute'] = 33
default['ec2-consistent-snapshot']['cron']['hour'] = 3
default['ec2-consistent-snapshot']['cron']['path'] = '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin'
default['ec2-consistent-snapshot']['cron']['mailto'] = nil