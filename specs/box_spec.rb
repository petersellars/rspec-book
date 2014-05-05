require_relative 'spec_helper'

describe port(22) do
  it { should be_listening }
end

describe host('rspec.catosplace.net') do
  it { should be_resolvable }
end
