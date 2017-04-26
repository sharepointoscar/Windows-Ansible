require_relative 'spec_helper'

describe command('Get-ExecutionPolicy') do
  its(:stdout) { should match /RemoteSigned/ }
  #its(:stderr) { should match /stderr/ }
  its(:exit_status) { should eq 0 }
end
describe user('vagrant') do
  it { should exist }
  it { should belong_to_group('Administrators')}
end

describe port(5985) do
  it { should be_listening }
end

describe file('c:/windows') do
  it { should be_directory }
  it { should_not be_writable.by('Everyone') }
end
