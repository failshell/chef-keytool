#
# Cookbook Name:: keytool_test
# Recipe:: default
#
# Copyright 2015, Christian Fischer, computerlyrik
#
# All rights reserved - Do Not Redistribute
#

cookbook_file 'etc/ssl/certs/cacert.class3.crt'
cookbook_file '/etc/ssl/certs/cacert-root.crt'
