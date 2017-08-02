require_relative '../spec_helper'
require_relative '../config_spec'

describe 'vyos4_config' do
  include_examples 'config_spec'
end

describe host('10.0.2.13') do
  it { should be_reachable }
end
