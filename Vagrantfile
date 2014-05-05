# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

# noinspection RubyResolve
# require_plugin is deprecated and should no longer be used
# Vagrant.require_plugin('vagrant-serverspec')

unless Vagrant.has_plugin?('vagrant-serverspec')
  raise 'vagrant-serverspec plugin is required to run the serverspec tests!'
end

# noinspection RubyResolve
unless Vagrant.has_plugin?('vagrant-hostsupdater')
  raise 'vagrant-hostsupdater plugin is required to enable host file updates!'
end

# noinspection RubyResolve
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'precise64'

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network 'private_network', ip:'192.168.33.10'
  config.vm.hostname = 'rspec.catosplace.net'

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|

    unless Vagrant.has_plugin?('vagrant-vbguest')
      print 'vagrant-vbguest helps ensure you have the correct Guest Additions'
    end

    # noinspection RubyResolve
    vb.name= 'RSpec-Book'
    # Use VBoxManage to customize the VM. For example to change memory:
    # noinspection RubyResolve
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end

  # Shell provisioning that installs librarian-puppet and runs it to install
  # puppet modules. After that it just runs puppet
  config.vm.provision :shell, :path => 'shell/bootstrap.sh'

  # Serverspec Tests
  # noinspection RubyResolve,RubyUnusedLocalVariable
  config.vm.provision :serverspec do |spec|
    # noinspection RubyUnusedLocalVariable
    spec.pattern = 'specs/*_spec.rb'
  end

end
