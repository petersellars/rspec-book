# == Class: basic
#
# Basic implementation of Librarian Puppet within a Vagrant Virtual Machine
#
class basic {
  # run apt-get update before anything else runs
  class { 'basic::update_aptget':
    stage => first,
  }
  class {'basic::users':}
  class {'basic::packages':}
  class {'basic::helpers':}

  Class['basic::users'] -> Class['basic::packages'] -> Class['basic::helpers']
}

# == Class: basic::users
#
# Ensures the Puppet group is present
class basic::users {
  group { 'puppet':
    ensure => 'present',
  }
}

# == Class: basic::packages
#
# Ensures some useful packages are installed
class basic::packages {
  package { 'tmux': ensure => installed }
  package { 'curl': ensure => installed }
  package { 'vim' : ensure => installed }
}

# == Class: basic::helpers
#
# Provides some helper scripts for running puppet and librarian-puppet
class basic::helpers {
  $puppet_dir = '/vagrant/puppet'

  # script to run puppet
  file { '/usr/local/bin/runpuppet':
    content => "sudo puppet apply -vv --modulepath=${puppet_dir}/modules/ \
                ${puppet_dir}/manifests/main.pp\n",
    mode    => '0755'
  }

  # script to run librarian-puppet
  file { '/usr/local/bin/runlibrarian':
    content => "cd ${puppet_dir} && sudo librarian-puppet update \n",
    mode    => '0755'
  }
}

# == Class: basic::update_aptget
#
# Brings the system up-to date after importing it with Vagrant
# Runs only once after booting (checks /tmp/apt-get-updated existence )
class basic::update_aptget {
  exec { 'apt-get update && touch /tmp/apt-get-updated':
    unless => 'test -e /tmp/apt-get-updated'
  }
}