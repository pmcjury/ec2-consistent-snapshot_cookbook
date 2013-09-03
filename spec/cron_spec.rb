require 'spec_helper'

describe 'ec2-consistent-snapshot::cron' do

  context 'when using centos 6.4' do
    let(:chef_run) {
      chef = ChefSpec::ChefRunner.new( :step_into => ['ec2_consistent_snapshot_script'], platform:'centos', version:'6.4' )
      chef.node.set['ec2-consistent-snapshot'][:script][:mysql] = true
      chef.node.set['ec2-consistent-snapshot'][:script][:socket] = '/tmp/mysql.sock'
      chef.node.set['ec2-consistent-snapshot'][:script][:freeze_filesystem] = ['/vol']
      chef.node.set['ec2-consistent-snapshot'][:script][:aws_credentials_file] = '/root/.awssecret'
      chef.node.set['ec2-consistent-snapshot'][:script][:mysql_master_status_file] = '/vol/mysql_status'
      chef.node.set['ec2-consistent-snapshot'][:script][:mysql_host] = 'localhost'
      chef.node.set['ec2-consistent-snapshot'][:script][:mysql_username] = 'snapshot'
      chef.node.set['ec2-consistent-snapshot'][:script][:mysql_password] = 'snap123'
      chef.node.set['ec2-consistent-snapshot'][:script][:description] = 'Prod dailey snapshot'
      chef.node.set['ec2-consistent-snapshot'][:script][:volumes] = ['vol-xxx']
      chef.converge 'ec2-consistent-snapshot::cron'
    }
    it 'should include the cron cookbook' do
      expect(chef_run).to include_recipe 'cron'
    end

    # can't seem to get chefspec to step into the lwrp
    # it 'should create ebs_snapshot' do
    #   expect(chef_run).to create_file '/usr/local/bin/ebs_snapshot'
    #   file = chef_run.template('/usr/local/bin/ebs_snapshot')
    #   expect(file).to be_owned_by('root', 'root')
    # end

  end
end