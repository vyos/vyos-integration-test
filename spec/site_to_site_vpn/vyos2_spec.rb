require_relative '../spec_helper'
require 'serverspec_vyos_config'

File.open('spec/site_to_site_vpn/vyos2_script.sh') do |file|
  file.each_line do |l|
    if l.start_with?("set")
      describe vyos_config(l.gsub(/set /, '')) do
        it { should be_exists }
      end
    end
  end
end
