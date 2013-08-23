#
# Cookbook Name:: ec2-consistent-snapshot
# Recipe:: default
#

include_recipe 'yum::epel' if platform_family?('rhel')
include_recipe 'xfs' if node['ec2-consistent-snapshot']['filesystem'] == 'xfs'

node['ec2-consistent-snapshot']['pkgs'].each do |pkg|
  package pkg
end

remote_file node['ec2-consistent-snapshot']['file'] do
  source   node['ec2-consistent-snapshot']['src']
  checksum node['ec2-consistent-snapshot']['checksum']
  owner    node['ec2-consistent-snapshot']['user']
  group    node['ec2-consistent-snapshot']['group']
  mode     0700
  action :create
end

# maybe make a data bag
template node['ec2-consistent-snapshot']['aws_file'] do
  source node['ec2-consistent-snapshot']['aws_template']
  variables({
    access_key_id: node['ec2-consistent-snapshot']['aws_access_key_id'],
    secret_access_key: node['ec2-consistent-snapshot']['aws_secret_access_key']
  })
end
