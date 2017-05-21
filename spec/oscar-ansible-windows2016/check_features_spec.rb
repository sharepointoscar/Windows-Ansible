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
# IIS Should be in stalled and running
describe service('IISADMIN') do
  it { should be_installed  }
  it { should be_enabled  }
  it { should be_running  }
  it { should have_start_mode("Automatic")  }
end

describe file('c:/windows') do
  it { should be_directory }
  it { should_not be_writable.by('Everyone') }
end
