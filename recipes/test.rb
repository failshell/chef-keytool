#
# Cookbook Name:: keytool
# Recipe:: test
#
# Copyright (C) 2014 Jean-Francois Theroux
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

keytool_manage 'thawtepremiumserverca' do
  action :exportcert
  keystore '/etc/pki/java/cacerts'
  storepass 'changeit'
end

keytool_manage 'extra-cnnicroot' do
  action :exportcert
  file '/var/tmp/extra-cnnicroot.crt'
  keystore '/etc/pki/java/cacerts'
  storepass 'changeit'
  additional '-v'
end
