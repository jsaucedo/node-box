require 'spec_helper'

describe_recipe 'ark::default' do
  def node_attributes
    { platform: 'windows', version: '2012R2' }
  end

  it 'does include the 7-zip recipe' do
    expect(chef_run).to include_recipe('seven_zip')
  end
end
