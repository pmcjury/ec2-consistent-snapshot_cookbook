actions :create, :delete
default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :shell, :kind_of => String, :default => 'bash'
attribute :source, :kind_of => String, :default => 'ec2-consistent-snapshot.erb'
attribute :cookbook, :kind_of => String, :default => 'ec2-consistent-snapshot'
attribute :mode, :kind_of => String, :default => '0700'
# options
attribute :freeze_filesystem, :kind_of => Array, :default => []
attribute :region, :kind_of => String, :default => 'us-east-1', :required => true
attribute :volumes, :kind_of => Array, :default => [], :required => true
attribute :description, :kind_of => String, :default => "ec2-consistent-snapshot $(date +'%Y-%m-%d %H:%M:%S')"
attribute :snapshot_timeout, :kind_of => [Float, NilClass], :default => nil
attribute :lock_timeout, :kind_of => [Float, String, NilClass], :default => nil
attribute :lock_tries, :kind_of => [Float, String, NilClass], :default => nil
attribute :lock_sleep, :kind_of => [Float, String, NilClass], :default => nil
attribute :pre_freeze_command, :kind_of => [String, NilClass], :default => nil
attribute :post_thaw_command, :kind_of => [String, NilClass], :default => nil

# mongo
attribute :mongo, :kind_of => [TrueClass, FalseClass], :default => false
attribute :mongo_host, :kind_of => [String, NilClass], :default => nil
attribute :mongo_port, :kind_of => [String, Integer, NilClass], :default => nil
attribute :mongo_username, :kind_of => [String, NilClass], :default => nil
attribute :mongo_password, :kind_of => [String, NilClass], :default => nil

# mysql
attribute :mysql, :kind_of => [TrueClass, FalseClass], :default => true
attribute :mysql_defaults_file, :kind_of => [String, NilClass],  :default => nil
attribute :mysql_host, :kind_of => [String, NilClass], :default => nil
attribute :mysql_port, :kind_of => [String, Integer, NilClass], :default => 3306

attribute :mysql_socket, :kind_of => [String, NilClass], :default => nil
attribute :mysql_username, :kind_of => [String, NilClass], :default => nil
attribute :mysql_password, :kind_of => [String, NilClass], :default => nil
attribute :mysql_master_status_file, :kind_of => [String, NilClass], :default => nil

# aws keys
attribute :aws_access_key_id, :kind_of => [String, NilClass], :default => nil
attribute :aws_secret_access_key, :kind_of => [String, NilClass], :default => nil
attribute :aws_access_key_id_file, :kind_of => [String, NilClass], :default => nil
attribute :aws_secret_access_key_file, :kind_of => [String, NilClass], :default => nil
attribute :aws_credentials_file, :kind_of => [String, NilClass], :default => nil
