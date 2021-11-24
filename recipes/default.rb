#
# Cookbook:: web_docker_host
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
apt_update
package 'net-tools'

directory '/home/ubuntu/webcontainer' do
  action :create
end

template '/home/ubuntu/webcontainer/index.html' do
  source 'index.html.erb'
  action :create
end

include_recipe 'web_docker_host::docker_setup'
