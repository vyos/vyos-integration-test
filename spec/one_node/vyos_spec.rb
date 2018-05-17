require_relative '../spec_helper'
require_relative '../config_spec'

describe 'vyos_config' do
  include_examples 'config_spec'
end

describe host_inventory['hostname'] do
  it { should eq 'router' }
end

describe host_inventory['domain'] do
  it { should eq 'example.com' }
end
