#
# Cookbook:: equinauts
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute "update-upgrade" do
  command "apt-get update && apt-get upgrade -y"
  action :run
end

include_recipe 'build-essential'
include_recipe 'ark'
include_recipe 'nodejs'
