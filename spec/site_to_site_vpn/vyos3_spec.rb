require_relative '../spec_helper'
require_relative '../config_spec'

describe 'vyos3_config' do
  include_examples 'config_spec'
end

describe host('10.0.3.14') do
  it { should be_reachable }
end
