#
# Cookbook:: web_docker_host
# Recipe:: docker_setup
#
# Copyright:: 2021, The Authors, All Rights Reserved.
docker_service 'default' do
  action [:create, :start]
end

# Add the ubuntu user to the docker group

group 'docker' do
  members 'ubuntu'
  append true
  action :modify
end

docker_image 'haproxy' do
  action :pull
end

docker_image 'httpd' do
  action :pull
end

begin_count = 0
end_count = node['web_docker_host']['webcontainer_count']
while begin_count < end_count
  docker_container "httpd-#{begin_count}" do
    repo 'httpd'
    volumes ['/home/ubuntu/webcontainer/:/usr/local/apache2/htdocs/']
    port "800#{begin_count}:80"
    read_timeout 60
    write_timeout 60
    action :run
  end
  begin_count += 1
end
