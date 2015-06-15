require 'spec_helper'

# check nginx install 
describe package('nginx') do
  it { should be_installed }
end

# check nginx running
describe service('nginx') do
  it { should be_running }
end

# check running port
describe port(80) do
  it { should be_listening.with('tcp') }
end

# check conf file
describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
end

# check log permission
describe file('/var/log/nginx') do
  it { should be_mode 755 }
end

