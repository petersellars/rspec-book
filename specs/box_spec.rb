require_relative 'spec_helper'

describe port(22) do
  it { should be_listening }
end

# Resovable on host
describe host('rspec.catosplace.net') do
  it { should be_resolvable }
  it { should be_resolvable.by('hosts') }
  it { should be_resolvable.by('dns') }
end

# Network Reachable
describe host('rspec.catosplace.net') do
  it { should be_reachable }
  it { should be_reachable.with( :port => 22 ) }
end

# Need to update vagrant-serverspec 'serverspec' version
#describe host('rspec.catosplace.net') do
#  its(:ipaddress) { should eq '192.168.33.10' }
#end