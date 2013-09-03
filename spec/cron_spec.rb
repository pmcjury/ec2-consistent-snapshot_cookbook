require 'spec_helper'

describe 'ec2-consistent-snapshot::cron' do

  context 'when using centos 6.4' do
    let(:chef_run) {
      chef = ChefSpec::ChefRunner.new( platform:'centos', version:'6.4' )
      chef.node.set['ec2-consistent-snapshot']['cron']['command'] = 'ec2-consistent-snapshot --mysql --mysql-socket /tmp/mysql.sock'
      chef.converge 'ec2-consistent-snapshot::cron'
    }

    it 'should include the cron cookbook' do
      expect(chef_run).to include_recipe 'cron::default'
    end

    # it 'should create the crontab' do
    #   expect(chef_run).to create_cron 'ec2-consistent-snapshot'#, 'ec2-consistent-snapshot --mysql --mysql-socket /tmp/mysql.sock'
    # end

  end
end
