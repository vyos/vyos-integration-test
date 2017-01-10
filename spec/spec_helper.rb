require 'serverspec'
require 'net/ssh'
require 'tempfile'

set :backend, :ssh
set :disable_sudo, true

test = ENV['TARGET_TEST']
host = ENV['TARGET_HOST']

Dir.chdir("spec/#{test}") do
  config = Tempfile.new('', Dir.tmpdir)
  `vagrant ssh-config #{host} > #{config.path}`
  options = Net::SSH::Config.for(host, [config.path])
  options[:user] ||= Etc.getlogin
  set :host,        options[:host_name] || host
  set :ssh_options, options
end
