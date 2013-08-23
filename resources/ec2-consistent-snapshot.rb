actions :create, :delete
default_action :create

attribute :path, :kind_of => String, :name_attribute => true
attribute :mysql_username, :kind_of => String, :default => "root"
attribute :region, :kind_of => String, :default => "us-east-1"
attribute :freeze_filesystem, :kind_of => String
attribute :mysql_socket, :kind_of => String
attribute :volumes, :kind_of => Array, :default => []
