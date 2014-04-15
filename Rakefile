require 'puppet-lint/tasks/puppet-lint'

# Disable certain puppet-lint checks
PuppetLint.configuration.send('disable_autoloader_layout')
PuppetLint.configuration.ignore_paths = ['puppet/modules/**/*.pp']

task :default => [:syntax, :lint]

task :syntax do
  valid = []
  invalid = []

  Dir.glob('puppet/manifests/*.pp').each do |puppet_file|
    puts "Checking syntax for #{puppet_file}"
    system("puppet parser validate #{puppet_file}")

    # Keep track of results
    if $?.success?
      valid << puppet_file
    else
      invalid << puppet_file
    end
  end

  # Print the results
  total_manifests = valid.count + invalid.count
  puts "#{total_manifests} files checked."
  puts "#{valid.count} file(s) validated."
  puts "#{invalid.count} file(s) are invalid."
  invalid.each do |filename|
    puts filename
  end

  # Fail the task if any files failed syntax check
  if invalid.count > 0
    fail("#{invalid.count} file(s) failed syntax check.")
  end

end