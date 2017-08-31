require 'spec_helper'

describe_recipe 'ark::default' do
  def node_attributes
    { platform: 'fedora', version: '24' }
  end

  it 'installs core packages' do
    expect(chef_run).to install_package(['libtool', 'autoconf', 'make', 'unzip', 'rsync', 'gcc', 'xz-lzma-compat', 'bzip2', 'tar'])
  end
end
