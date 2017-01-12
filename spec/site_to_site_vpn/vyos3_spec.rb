require_relative '../spec_helper'
require_relative '../config_spec'

config_spec

describe host('10.0.3.14') do
  it { should be_reachable }
end
