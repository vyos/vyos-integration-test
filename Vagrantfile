require 'erb'
require 'yaml'

configs = YAML.load_file('config.yaml')

Vagrant.configure('2') do |config|
  config.vm.provider :libvirt do |libvirt|
    cpuinfo = File.read('/proc/cpuinfo')
    if cpuinfo =~ /vmx|svm/
      libvirt.cpu_mode = 'host-passthrough'
    else
      libvirt.driver = 'qemu'
      libvirt.cpu_mode = 'custom'
      libvirt.cpu_model = 'Nehalem'
      libvirt.cpu_feature name: 'vmx', policy: 'force'
    end
  end
  configs.keys.each do |host|
    config.vm.define host.to_sym do |c|
      c.vm.box = 'higebu/vyos'
      c.vm.synced_folder './', '/vagrant',
                         owner: 'vagrant',
                         group: 'vyattacfg',
                         mount_options: ['dmode=775,fmode=775']
      c.vm.hostname = host

      $script = ''
      if !configs[host].nil? && configs[host].key?(:networks)
        configs[host][:networks].keys.each do |net|
          c.vm.network :private_network,
                       auto_config: false,
                       libvirt__network_name: net,
                       libvirt__dhcp_enabled: false,
                       libvirt__forward_mode: 'veryisolated'
        end
        $script = ERB.new(File.read('../interface_script.erb')).result(binding)
      end
      if !$script.empty?
        c.vm.provision 'shell', inline: $script
      end
      c.vm.provision 'shell', path: "#{host}_script.sh"
    end
  end
end
