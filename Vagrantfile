# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
 

  config.vm.hostname = "ec2-consistent-snapshot-berkshelf"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "opscode_centos-6.4-i386_provisionerless"

  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4-i386_provisionerless.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.ssh.max_tries = 40

  config.ssh.timeout   = 120

  config.berkshelf.enabled = true

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      },
      'ec2-consistent-snapshot' => {
        :script => {
          :mysql => true,
          :socket => '/tmp/mysql.sock',
          :freeze_filesystem => ['/vol'],
          :aws_credentials_file => '/root/.awssecret',
          :mysql_master_status_file => '/vol/mysql_status',
          :mysql_host => 'localhost',
          :mysql_username => 'snapshot',
          :mysql_password => 'snapshot123',
          :description => "dailey snapshot",
          :volumes => ['xxxxx']
        }
      }
    }

    chef.run_list = [
      "recipe[ec2-consistent-snapshot::default]",
      "recipe[ec2-consistent-snapshot::cron]"
    ]
  end
end
