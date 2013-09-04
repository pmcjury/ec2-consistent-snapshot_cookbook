def whyrun_supported?
  true
end

use_inline_resources

action :delete do
  Chef::Log.info "Deleting script #{new_resource.name}"
  converge_by("Deleting #{ @new_resource.name }") do
    template new_resource.name do
      action :delete
    end
  end
end

action :create do
  Chef::Log.info "Creating script #{new_resource.name}"
  converge_by("Create #{ @new_resource.name }") do
    template new_resource.name do
      source new_resource.source
      cookbook new_resource.cookbook

      variables({
                  :name => new_resource.name,
                  # options
                  :shell => new_resource.shell,
                  :freeze_filesystem => new_resource.freeze_filesystem,
                  :region => new_resource.region,
                  :volumes => new_resource.volumes,
                  :description => new_resource.description,
                  :snapshot_timeout => new_resource.snapshot_timeout,
                  :lock_timeout => new_resource.lock_timeout,
                  :lock_tries => new_resource.lock_tries,
                  :lock_sleep => new_resource.lock_sleep,
                  :pre_freeze_command => new_resource.pre_freeze_command,
                  :post_thaw_command => new_resource.post_thaw_command,

                  # mongo
                  :mongo => new_resource.mongo,
                  :mongo_host => new_resource.mongo_host,
                  :mongo_port => new_resource.mongo_port,
                  :mongo_username => new_resource.mongo_username,
                  :mongo_password => new_resource.mongo_password,

                  # mysql
                  :mysql => new_resource.mysql,
                  :mysql_defaults_file => new_resource.mysql_defaults_file,
                  :mysql_host => new_resource.mysql_host,

                  :mysql_socket => new_resource.mysql_socket,
                  :mysql_username => new_resource.mysql_username,
                  :mysql_password => new_resource.mysql_password,
                  :mysql_master_status_file => new_resource.mysql_master_status_file,

                  # aws keys
                  :aws_access_key_id => new_resource.aws_access_key_id,
                  :aws_secret_access_key => new_resource.aws_secret_access_key,
                  :aws_access_key_id_file => new_resource.aws_access_key_id_file,
                  :aws_secret_access_key_file => new_resource.aws_secret_access_key_file,
                  :aws_credentials_file => new_resource.aws_credentials_file

      })

      mode new_resource.mode
    end
  end
  new_resource.updated_by_last_action(true) # shouldn't need to do this since its wrapped in converge_by, but food critic complains
end
