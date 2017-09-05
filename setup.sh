#!/bin/bash

#
# chmod +x setup.sh
# sudo ./setup.sh
# ssh-agent forwarding https://developer.github.com/enterprise/2.10/v3/guides/using-ssh-agent-forwarding/

sudo -su root

cd /srv
mkdir equinauts
cd equinauts
echo "equinauts dir created."

git clone https://github.com/jsaucedo/node-box.git
cd node-box

echo "{\"run_list\": [\"recipe[equinauts]\"]}" >> run_list.json

echo "file_cache_path \"/root/chef-solo\"" >> solo.rb
echo "cookbook_path \"/srv/equinauts/node-box/cookbooks/\"" >> solo.rb

curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -v 13.2.20

chef-solo -j /srv/equinauts/node-box/run_list.json -c /srv/equinauts/node-box/solo.rb
