require 'serverspec_vyos_config'

def config_spec
  test = ENV['TARGET_TEST']
  host = ENV['TARGET_HOST']

  File.open("spec/#{test}/#{host}_script.sh") do |file|
    file.each_line do |l|
      next unless l.start_with?('set')
      describe vyos_config(l.gsub(/set /, '')) do
        it { should be_exists }
      end
    end
  end
end
