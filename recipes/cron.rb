
# Cookbook Name:: ec2-consistent-snapshot
# Recipe:: cron
include_recipe 'cron::default'

cron = node['ec2-consistent-snapshot']['cron']

cron_d "ec2-consistent-snapshot" do
  minute cron['minute']
  hour cron['hour']
  day cron['day']
  month cron['month']
  weekday cron['weekday']
  command cron['command']
  user cron['user']
  mailto cron['mailto']
  path cron['path']
  home cron['home']
  shell cron['shell']
end
