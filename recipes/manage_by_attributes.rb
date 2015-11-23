#
# Cookbook Name:: keytool
# Recipe:: manage_by_attributes
#
# Copyright 2015, computerlyrik, Christian Fischer
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node['keytool']['keystores'].each do |label,keystore|
  keystore.certificates.each do |cert_name, cert_path|

    keytool_manage "import certificate #{cert_name} into keystore #{label}" do
      keytool keystore[:keytool] || "#{node['java']['java_home']}/bin/keytool"
      keystore keystore[:path] || "#{node['java']['java_home']}/jre/lib/security/cacerts"
      storepass keystore[:password] || "changeit"
      cert_alias cert_name
      file cert_path
      additional "-trustcacerts"
      action :importcert
    end
  end
end
