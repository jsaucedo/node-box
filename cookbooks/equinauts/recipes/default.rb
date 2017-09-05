
# Cookbook:: equinauts
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute 'update-upgrade' do
  command 'apt-get update && apt-get upgrade -y'
  action :run
end

execute 'install nodejs & npm' do
  command 'curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - && sudo apt-get install -y nodejs'
  action :run
end

execute 'install git' do
  command 'sudo apt-get install git -y'
  action :run
end

execute 'install yarn' do
  command 'sudo apt-get install yarn -y'
  action :run
end
