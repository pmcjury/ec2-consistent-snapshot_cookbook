#
# Cookbook Name:: ec2-consistent-snapshot
# Recipe:: default
#
# we want this on top so it runs first hopefully
include_recipe 'yum::epel' if platform_family?('rhel')
include_recipe 'apt' if platform_family?('debian')
#use xfs if you choose it in attribute
include_recipe 'xfs' if node['ec2-consistent-snapshot']['filesystem'] == 'xfs'

# RHEL
if platform_family?('rhel')
  remote_file node['ec2-consistent-snapshot']['file'] do
    source   node['ec2-consistent-snapshot']['src']
    checksum node['ec2-consistent-snapshot']['checksum']
    owner    node['ec2-consistent-snapshot']['user']
    group    node['ec2-consistent-snapshot']['group']
    mode     0700
    action :create
  end
end
#DEBIAN
if platform_family?('debian')
  apt_repository node['ec2-consistent-snapshot']['repo'] do
    uri node['ec2-consistent-snapshot']['repo_uri']
    components ["main"]
    keyserver node['ec2-consistent-snapshot']['keyserver']
    key node['ec2-consistent-snapshot']['key']
  end
end

node['ec2-consistent-snapshot']['pkgs'].each do |pkg|
  package pkg
end

# should probably use a databag
template node['ec2-consistent-snapshot']['aws_file'] do
  source node['ec2-consistent-snapshot']['aws_template']
  variables({
              access_key_id: node['ec2-consistent-snapshot']['aws_access_key_id'],
              secret_access_key: node['ec2-consistent-snapshot']['aws_secret_access_key']
  })
end
