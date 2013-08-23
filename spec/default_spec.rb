require 'spec_helper'

describe 'ec2-consistent-snapshot::default' do

  context 'centos 6.4' do
    let(:chef_run) {
      chef = ChefSpec::ChefRunner.new( platform:'centos', version:'6.4' )
      chef.converge 'ec2-consistent-snapshot::default'
    }
    it 'should include yum::epel cookbook' do
      expect(chef_run).to include_recipe "yum::epel"
    end

    it 'should not include xfs cookbook' do
      expect(chef_run).not_to include_recipe "xfs"
    end

    %w{
      perl-Net-Amazon-EC2 perl-File-Slurp perl-DBI perl-DBD-MySQL perl-Net-SSLeay perl-IO-Socket-SSL perl-Time-HiRes
      perl-DateTime perl-Params-Validate
    }.each do |pkg|
      it "should include the package #{pkg}" do
        expect(chef_run).to install_package pkg
      end
    end

    it 'should create the remote file from github ec2-consistent-snapshot repo' do
      # expect(chef_run).to create_remote_file('/usr/local/bin/ec2-consistent-snapshot')
      expect(chef_run).to create_remote_file('/usr/local/bin/ec2-consistent-snapshot').with(
        :source => 'https://raw.github.com/alestic/ec2-consistent-snapshot/master/ec2-consistent-snapshot',
        :checksum => 'cd401d2e1aedf7c9d390e4bc50c08b7cebc631e709a9677c146800c06d42069a',
        :owner => 'root',
        :group => 'root',
        :mode => 0700
      )
    end

  end

  context 'ubuntu 12.04' do
    let(:chef_run) {
      chef = ChefSpec::ChefRunner.new( platform:'ubuntu', version:'12.04' )
      chef.converge 'ec2-consistent-snapshot::default'
    }

    it 'should not include yum::epel cookbook' do
      expect(chef_run).not_to include_recipe 'yum::epel'
    end

  end

  # context 'xfs file system' do
  #   let(:chef_run) {
  #     chef = ChefSpec::ChefRunner.new
  #     chef_run.node['ec2-consistent-snapshot']['filesystem'] = 'xfs'
  #     chef.converge 'ec2-consistent-snapshot::default'
  #   }

  #   it 'should include xfs cookook' do
  #     expect(chef_run).to include_recipe 'xfs'
  #   end
  # end

end
