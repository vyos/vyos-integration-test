require_relative '../spec_helper'
require_relative '../config_spec'

describe 'vyos3_config' do
  include_examples 'config_spec'
end

# Wait for advertising
sleep(60)

describe host('10.0.3.14') do
  it { should be_reachable.with(timeout: 10) }
end
