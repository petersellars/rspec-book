# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

# noinspection RubyResolve
unless Vagrant.has_plugin?('vagrant-serverspec')
  raise 'vagrant-serverspec plugin is required to run the serverspec tests!'
end

# noinspection RubyResolve
unless Vagrant.has_plugin?('vagrant-hostsupdater')
  raise 'vagrant-hostsupdater plugin is required to enable host file updates!'
end

# noinspection RubyResolve
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network 'private_network', ip:'192.168.33.10'
  config.vm.hostname = 'rspec.catosplace.net'

  # SSH Agent Forwarding
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|

    # noinspection RubyResolvevagra
    unless Vagrant.has_plugin?('vagrant-vbguest')
      print 'vagrant-vbguest helps ensure you have the correct Guest Additions'
    end

    # noinspection RubyResolve
    vb.name= 'RSpec-Book'
    # noinspection RubyResolve
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  # Shell provisioning that installs librarian-puppet and runs it to install
  # puppet modules. After that it just runs puppet
  config.vm.provision :shell, :path => 'shell/bootstrap.sh'

  # Github Setup/Clone RSpec Book Examples
  config.vm.provision :shell,
    :path => 'shell/github.sh', :args => "#{ENV['GIT_USER']}  #{ENV['GIT_USER_EMAIL']}",
    :privileged => false

  # Serverspec Tests
  # noinspection RubyResolve
  config.vm.provision :serverspec do |spec|
    spec.pattern = 'specs/*_spec.rb'
  end

end
