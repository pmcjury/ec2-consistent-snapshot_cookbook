#
# Cookbook Name:: ec2-consistent-snapshot
# Recipe:: cron
#
include_recipe 'cron'

script = ec2_consistent_snapshot_script node['ec2-consistent-snapshot']['script']['name'] do
  mysql node['ec2-consistent-snapshot']['script']['mysql']
  mysql_socket node['ec2-consistent-snapshot']['script']['mysql_socket']
  freeze_filesystem node['ec2-consistent-snapshot']['script']['freeze_filesystem']
  aws_credentials_file node['ec2-consistent-snapshot']['script']['aws_credentials_file']
  mysql_master_status_file node['ec2-consistent-snapshot']['script']['mysql_master_status_file']
  mysql_host node['ec2-consistent-snapshot']['script']['mysql_host']
  mysql_username node['ec2-consistent-snapshot']['script']['mysql_username']
  mysql_password node['ec2-consistent-snapshot']['script']['mysql_password']
  description node['ec2-consistent-snapshot']['script']['description']
  volumes node['ec2-consistent-snapshot']['script']['volumes']
end

cron_d node['ec2-consistent-snapshot']['cron']['name'] do
  minute node['ec2-consistent-snapshot']['cron']['minute']
  hour node['ec2-consistent-snapshot']['cron']['hour']
  command script.name
  user node['ec2-consistent-snapshot']['user']
  mailto node['ec2-consistent-snapshot']['cron']['mailto']
  path node['ec2-consistent-snapshot']['cron']['path']
end
