#
# Cookbook:: web_docker_host
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.
apt_update
package 'net-tools'
include_recipe 'web_docker_host::docker_setup'
