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

def already_in_keystore?(cert_alias)
  keytool = @keytool + " -list"

  begin
    Mixlib::ShellOut.new(keytool).run_command.error!
    true
  rescue
    false
  end
end

action :exportcert do
  @keytool += " -file #{@cert_file} -exportcert"

  unless ::File.exists?(@cert_file)
    Mixlib::ShellOut.new(@keytool).run_command.error!
    Chef::Log.info("keytool_manage[#{new_resource.cert_alias}] exported to #{@cert_file}")
  end
end

action :importcert do
  @keytool += " -file #{@cert_file} -importcert"
  @keytool.insert(0, 'echo yes | ')


  if ::File.exists?(@cert_file)
    unless already_in_keystore?(new_resource.cert_alias)
      Mixlib::ShellOut.new(@keytool).run_command.error!
      Chef::Log.info("keytool_manage[#{new_resource.cert_alias}] imported to #{new_resource.keystore}")
    end
  end
end

action :deletecert do
  @keytool += ' -delete'

  if already_in_keystore?(new_resource.cert_alias)
    Mixlib::ShellOut.new(@keytool).run_command.error!
    Chef::Log.info("keytool_manage[#{new_resource.cert_alias}] deleted from #{new_resource.keystore}")
  end
end

action :storepasswd do
  @keytool += " -storepasswd -new #{new_resource.new_pass}"

  Mixlib::ShellOut.new(@keytool).run_command.error!
  Chef::Log.info("keytool_manage[#{new_resource.cert_alias}] changed storepass for #{new_resource.keystore}")
end
