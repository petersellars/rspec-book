require 'puppet-lint/tasks/puppet-lint'

# Disable certain puppet-lint checks
PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.ignore_paths = ["puppet/modules/**/*.pp"]

task :default => [:lint]