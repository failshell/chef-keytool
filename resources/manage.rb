actions :exportcert, :importcert, :deletecert, :storepasswd
default_action :exportcert

attribute :additional, :kind_of => String
attribute :cert_alias, :kind_of => String, :name_attribute => true
attribute :file, :kind_of => String
attribute :keystore, :kind_of => String, :required => true
attribute :keytool, :kind_of => String, :default => 'keytool'
attribute :new_pass, :kind_of => String
attribute :storepass, :kind_of => String, :required => true
