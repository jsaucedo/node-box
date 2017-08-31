#
# Cookbook:: equinauts
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute "update-upgrade" do
  command "apt-get update && apt-get upgrade -y"
  action :run
end

#node.default['nodejs']['install_method'] = 'package'
#node.default['nodejs']['version'] = '5.9.0'

node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '5.9.0'
node.default['nodejs']['binary']['checksum'] = '99c4136cf61761fac5ac57f80544140a3793b63e00a65d4a0e528c9db328bf40'

include_recipe 'build-essential'
include_recipe 'ark'
include_recipe 'nodejs'
