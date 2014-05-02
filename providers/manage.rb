require 'mixlib/shellout'

use_inline_resources

def load_current_resource
  @keytool = new_resource.keytool
  @keytool += " -keystore #{new_resource.keystore}"
  @keytool += " -storepass #{new_resource.storepass}"
  @keytool += " -alias #{new_resource.cert_alias}"
  @keytool += " #{new_resource.additional}" unless new_resource.additional.nil?

  @cert_file = new_resource.file.nil? ? "/tmp/#{new_resource.name}.crt" : new_resource.file
end

action :exportcert do
  @keytool += " -file #{@cert_file} -export"

  unless ::File.exists?(@cert_file)
    Mixlib::ShellOut.new(@keytool).run_command.error!
    Chef::Log.info("keytool_manage[#{new_resource.cert_alias}] exported to #{@cert_file}")
  end
end
