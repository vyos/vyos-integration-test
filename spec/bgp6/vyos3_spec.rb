require_relative '../spec_helper'
require_relative '../config_spec'

config_spec

# Wait for advertising
sleep(10)

describe command('ping6 -w 5 -c 2 -n fd00:5679:4f53:3::e') do
  its(:exit_status) { should eq 0 }
end

