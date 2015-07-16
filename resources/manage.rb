actions :exportcert, :importcert, :deletecert, :storepasswd, :importkeystore
default_action :exportcert

attribute :additional, :kind_of => String
attribute :cert_alias, :kind_of => String
attribute :file, :kind_of => String
attribute :keystore, :kind_of => String, :required => true
attribute :keytool, :kind_of => String, :default => 'keytool'
attribute :new_pass, :kind_of => String
attribute :storepass, :kind_of => String, :required => true
attribute :storepass_file, :kind_of => String

# these attributes are specific to the :importkeystore action
attribute :srcstoretype, :kind_of => String
attribute :srcstorepass, :kind_of => String
